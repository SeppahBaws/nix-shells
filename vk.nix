let
  pkgs = import <nixpkgs> {};
in
pkgs.mkShell {
  packages = with pkgs; [
    cmake
    clang-tools
    gcc
    python310
    pkg-config
    libxc
    lz4
    ninja
    #qt5.full # the nuclear option
    qt5.qmake # a more surgical approach
    wayland
    xorg.libX11
    xorg.libxcb
    xorg.libXau
    xorg.libXdmcp
    xorg.libXrandr
    xorg.libXinerama # added for Vulkan-Samples
    xorg.libXcursor # added for Vulkan-Samples
    glm # added for SaschaWillems/Vulkan
    #vulkan-utils # added for ICD loader (to support the GPU)
    vulkan-loader
    vulkan-tools
  ];

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (with pkgs; [
    libxc
    xorg.libX11
    xorg.libXau
    xorg.libxcb
    xorg.libXdmcp
    xorg.libXrandr
    xorg.libXinerama # added for Vulkan-Samples
    xorg.libXcursor # added for Vulkan-Samples
  ]);

  VK_ICD_FILENAMES="/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json";

  shellHook = ''
    source ~/Vulkan/1.4.321.1/setup-env.sh
  '';
}

