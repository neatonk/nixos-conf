# Disable annoying beep!
{...}: { boot.blacklistedKernelModules = [ "snd_pcsp" "pcspkr" ]; }