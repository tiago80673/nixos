{...}:
{
	# activate by sudo /run/current-system/specialisation/XXXX/activate
	# sudo /run/booted-system/activate to return to original
	# or nixos-rebuild switch --no-reexec
	specialisation = {
		lidSuspend.configuration = {
			services.logind.lidSwitch = "suspend";
			system.activationScripts.restartLogind = {
				text = ''
					echo "Restarting logind for specialisation"
					#echo `ls /run/current-system/specialisation/` # if this folder has content then we are on the no-specialised system, which we shouldnt
					# /run/current-system/systemd/bin/systemctl reload systemd-logind.service
				'';
				# This can break? 
				# it seems that when we run the activationScript, /run/current-system/ is still the no-specialised system 
				# so when we reload logind service, we are changing the old systemd? which can be diff 
				# it broke once but now seems ok(?)
			};
		};
		lidIgnore.configuration = {
			services.logind.lidSwitch = "ignore";
			system.activationScripts.restartLogind = {
				text = ''
					echo "Restarting logind for specialisation"
					# /run/current-system/systemd/bin/systemctl reload systemd-logind.service
				'';
			};
		};
	};
}
