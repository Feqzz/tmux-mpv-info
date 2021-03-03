# tmux-mpv-info
Displays the current song playing with MPV in your tmux status bar. When playback is paused, a pause icon is displayed next to the artist.
![](https://feqzz.no/img/tmux-mpv-info-example.png)

## Installation
Dependencies:
* socat
* jq

### Installation with Tmux Plugin Manager
Edit your `.tmux.conf` and append the plugin to your TPM list.

```tmux
set -g @plugin 'feqzz/tmux-mpv-info'
```
Remember to hit `<prefix> + I` to install the plugin.

### Manual
Clone the repo:
``` bash
git clone https://github.com/feqzz/tmux-mpv-info ~/.tmux/
```
Edit your `.tmux.conf` and add this line at the bottom.
``` bash
run-shell ~/.tmux/tmux-mpv-info/tmux-mpv-info.tmux
```
Last step is to reload the tmux config file.
``` bash
tmux source-file ~/.tmux.conf
```

## Usage
Edit your `.tmux.conf` file and add `#{mpv_info}` to your `status-right`. Simple example:
``` tmux
set -g status-right "#{mpv_info}"
```
### MPV
To actually use the plugin with mpv, a mpvsocket has to be initiated in /tmp/mpvsocket. This can easily be done by adding this flag:
``` bash
mpv song.flac --input-ipc-server=/tmp/mpvsocket
```
Personally I have added this flag permanently to my `mpv.conf`.
``` bash
input-ipc-server=/tmp/mpvsocket
```
## License
[MIT](LICENSE.md)
