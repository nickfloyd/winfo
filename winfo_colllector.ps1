function collect_winfo () {

   get-wmiobject win32_computersystem | sort Name | select-object Name, Model, Manufacturer, Description, DNSHostName, Domain, DomainRole, PartOfDomain, NumberOfProcessors, SystemType, TotalPhysicalMemory, UserName, Workgroup | export-csv -NoTypeInformation computer.csv
   
   get-wmiobject win32_operatingsystem | sort Name | select-object Name, Version, FreePhysicalMemory, OSLanguage, OSProductSuite, OSType, ServicePackMajorVersion, ServicePackMinorVersion | export-csv -NoTypeInformation os.csv
   
   get-wmiobject win32_logicaldisk | sort Name | select-object Name, Description, Size, FreeSpace, FileSystem, VolumeName, VolumeSerialNumber, QuotaDisabled | export-csv -NoTypeInformation disks.csv
   
   get-wmiobject win32_physicalmemory | sort Name | select-object Name, Capacity, DeviceLocator, Tag | export-csv memory.csv
   
   get-wmiobject win32_process | sort Name | select-object Name, ProcessID, Handel, VM, WS, UserModeTime, KernelModeTime, PageFaults, PageFileUsage, CommandLine, ExecutablePath | export-csv -NoTypeInformation processes.csv 
   
   get-wmiobject win32_service | sort Name | select-object Name, Started, StartMode, State, PathName, ProcessID, Status, ExitCode, AcceptStop, AcceptPause, Description | export-csv -NoTypeInformation services.csv

   get-wmiobject win32_product | sort Name | select-object Name, Version, Vendor, InstallLocation, InstallDate, PackageCache, Description | export-csv -NoTypeInformation installed_software.csv

   get-wmiobject win32_quickfixengineering | sort Name | select-object HotfixID, Description, InstalledOn, InstalledBy | export-csv -NoTypeInformation installed_hotfixes.csv

}

function send_winfo(){
	#Choose how / choose where
	# cmd -sendto email or -sendto zip or -sendto gist 


}


getwmiinfo