# WARNING: This is a preset for Dell Precision 5520 with NVIDIA Quadro M1200 Dedicated GPU

{ config, lib, ... }: 
let 
  cfg = config.configuration.nvidia;
in {
  options.configuration.nvidia = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables NVIDIA GPU";
    };
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.nvidia.acceptLicense = true;

    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;

    hardware.nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      prime = {
        offload.enable = true;
        offload.enableOffloadCmd = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };

    boot.kernelParams = [
      "acpi_rev_override=1"
      "acpi_osi=Linux"
      "nouveau.modeset=0"
      "pcie_aspm=force"
      "drm.vblankoffdelay=1"
      "nouveau.runpm=0"
      "mem_sleep_default=deep"
      "i915.enable_psr=0"
      "nvidia_drm.modeset=1"
    ];
  };
}
