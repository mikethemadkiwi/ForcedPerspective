local ForceCamera = {
    onfoot = 1,
    invehicles = 4
}
-- types: (0)close (1)near (2)far (3) cinematic?? (4)first person
Citizen.CreateThread(function()
    SetFollowPedCamViewMode(ForceCamera.onfoot)
    SetFollowVehicleCamViewMode(ForceCamera.invehicles)
	while true do
		Citizen.Wait(0)
		if NetworkIsPlayerActive(PlayerId()) then
            if IsPedOnFoot(GetPlayerPed(-1)) then               
                DisableControlAction(0, 0, true)
                SetFollowPedCamViewMode(ForceCamera.onfoot)
                SetFollowVehicleCamViewMode(ForceCamera.invehicles)
            else              
                DisableControlAction(0, 0, true)
                SetFollowPedCamViewMode(ForceCamera.invehicles)
                SetFollowVehicleCamViewMode(ForceCamera.invehicles)
            end
		end
	end
end)
                