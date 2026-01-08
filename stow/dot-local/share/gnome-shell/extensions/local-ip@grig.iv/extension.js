import GLib from 'gi://GLib';
import St from 'gi://St';
import Clutter from 'gi://Clutter';
import { Extension } from 'resource:///org/gnome/shell/extensions/extension.js';
import * as Main from 'resource:///org/gnome/shell/ui/main.js';
import * as PanelMenu from 'resource:///org/gnome/shell/ui/panelMenu.js';

export default class LocalIPExtension extends Extension {
    enable() {
        // Create a panel button
        this._indicator = new PanelMenu.Button(0.0, this.metadata.name, false);

        // Create a label to show the IP
        this._label = new St.Label({
            text: 'Loading...',
            y_align: Clutter.ActorAlign.CENTER,
            style_class: 'system-status-icon'
        });

        this._indicator.add_child(this._label);

        // Add the indicator to the panel (right side)
        Main.panel.addToStatusArea(this.uuid, this._indicator);

        // Update the IP immediately
        this._updateIP();

        // Set up a timer to update every 30 seconds
        this._timeout = GLib.timeout_add_seconds(GLib.PRIORITY_DEFAULT, 30, () => {
            this._updateIP();
            return GLib.SOURCE_CONTINUE;
        });
    }

    _updateIP() {
        try {
            // Run the ip command to get local IP
            let [success, stdout, stderr] = GLib.spawn_command_line_sync(
                'ip -4 addr show scope global'
            );

            let resp = GLib.spawn_command_line_sync(
                '/usr/bin/whoami'
            );

            if (success) {
                let output = new TextDecoder().decode(stdout);
                let ipMatch = output.match(/inet\s+(\d+\.\d+\.\d+\.\d+)/);

                if (ipMatch && ipMatch[1]) {
                    this._label.set_text(`🌐 ${ipMatch[1]}`);
                } else {
                    this._label.set_text('🌐 No IP');
                }
            } else {
                this._label.set_text('🌐 Error');
            }
        } catch (e) {
            console.error('Error getting IP:', e);
            this._label.set_text('🌐 Error');
        }
    }

    disable() {
        // Remove the timeout
        if (this._timeout) {
            GLib.Source.remove(this._timeout);
            this._timeout = null;
        }

        // Destroy the indicator
        if (this._indicator) {
            this._indicator.destroy();
            this._indicator = null;
        }

        this._label = null;
    }
}
