 --- Dependencies ---
 To run this script, you need the following packages installed:
 1. clamav          - The antivirus engine (provides 'clamscan')(and 'freshclam' for database updates)
 2. libnotify-bin   - For desktop pop-up notifications (provides 'notify-send')
 3. iproute2        - For network statistics (provides 'ss')
 4. zenity          - For graphical password prompts
 5. coreutils/grep  - Standard Linux utilities

Netvscan uses iproute2 and clamav to scan your linux system.

Created a user environment installer installs to ~./local/bin so should be able to run on most linux distros

first run asks for root password then saves the password so no need to keep typing in with prompt.

Sets up bashrc with .local/bin environment ans creates all folders needed.

been runing this project on Nixos works fine but needs entries to nixconfig.nix file

 Enable ClamAV and automatic database updates
  services.clamav.daemon.enable = true;
  services.clamav.updater.enable = true;

If you would like to help me with this project it would be great to improve this for everyone that would like to use this virus monitor/scaner
