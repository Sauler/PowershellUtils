function Set-LockscreenWallpaper($path) {
    Add-Type -Path PoshWinRT.dll
	[Windows.Storage.StorageFile,Windows.Storage,ContentType=WindowsRuntime]
	$asyncOp = [Windows.Storage.StorageFile]::GetFileFromPathAsync($path)
	$typeName = 'PoshWinRT.AsyncOperationWrapper[Windows.Storage.StorageFile]'
	$wrapper = new-object $typeName -Arg $asyncOp
	$file = $wrapper.AwaitResult()
	$null = [Windows.System.UserProfile.LockScreen,Windows.System.UserProfile,ContentType=WindowsRuntime]
	[Windows.System.UserProfile.LockScreen]::SetImageFileAsync($file)
}