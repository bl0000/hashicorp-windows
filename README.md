# hashicorp-windows

A repo for setting up and management HashiCorp services on Windows Server - set to public so I don't have to bother with logging in to access this.

Install nomad from https://developer.hashicorp.com/nomad/downloads

Clone repo onto server you wish to install HashiCorp services onto

Create folder on C:\ called "nomad" then run setupNomad.ps1

Testing:

Attempted to run test job (from server, run "nomad job init" then "nomad job run example.nomad") - needed Docker

As this is being ran on Windows, NoMad uses Docker as a backend - this becomes more complicated as Docker is linux-native. The following sites will be helpful for setting up Docker on Windows Server:

https://developer.hashicorp.com/nomad/docs/drivers/docker
https://developer.hashicorp.com/nomad/docs/faq#q-how-to-connect-to-my-host-network-when-using-docker-desktop-windows-and-macos
https://docs.docker.com/desktop/windows/wsl/

If you would just like to run jobs natively/without isolation (which is one of the main reasons to run a nomad client on Windows Server), this isn't relevant as the "raw-exec" drivers will be used. I've enabled raw_exec in the client.hcl file for this reason, however if you do not need this, I recommend that you disable raw_exec (removing the line will disable this as raw_exec is disabled by default).



