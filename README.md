# DockerTutorialGPU
docker tutorials using gpu passthrough (linux only for now. i'll work on windows branch later)

## Assumed Hardware:
x86_64 processor with nvidia GPU

## Setup

You may need to restart your computer (up to 2 times).

Run `./install_prereqs.sh` and it will do check for 3 things:
- docker & docker compose (may require signout or reboot)
- nvidia drivers (requires reboot)
- nvidia-docker2 package for docker GPU passthrough 

If any is not met it will installed (and some require reboot)

To test installation works feel free to try this GPU docker command:
```bash
sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi
```

## Commands to Run

## Other
