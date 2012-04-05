function getwmiinfo () {

   $path = "c:\temp"
   
   get-wmiobject win32_ComputerSystem | sort name | select-object Name, Model, Manufacturer, Description, DNSHostName, Domain, DomainRole, PartOfDomain, NumberOfProcessors, SystemType, TotalPhysicalMemory, UserName, Workgroup | export-csv $path\computer.csv
   
   get-wmiobject win32_OperatingSystem | sort name | select-object Name, Version, FreePhysicalMemory, OSLanguage, OSProductSuite, OSType, ServicePackMajorVersion, ServicePackMinorVersion | export-csv $path\os.csv
   
   get-wmiobject win32_logicaldisk | sort name | select-object NAME,DESCRIPTION,SIZE,FREESPACE,FILESYSTEM,VOLUMENAME,VOLUMESERIALNUMBER,QUOTASDISABLED | export-csv $path\disks.csv
   
   get-wmiobject win32_PhysicalMemory | sort name | select-object NAME, CAPACITY, DEVICELOCATOR, TAG | export-csv $path\memory.csv
   
   get-wmiobject win32_process | sort name | select-object NAME,PROCESSID,HANDLE,VM,WS,USERMODETIME,KERNELMODETIME,PAGEFAULTS,PAGEFILEUSAGE,COMMANDLINE,EXECUTABLEPATH | export-csv $path\processes.csv 
   
   get-wmiobject win32_service | sort name | select-object NAME,STARTED,STARTMODE,STATE,PATHNAME,PROCESSID,STATUS,EXITCODE,ACCEPTSTOP,ACCEPTPAUSE,DESCRIPTION | export-csv $path\services.csv

   get-wmiobject win32_product | sort name | select-object NAME,VERSION,VENDOR,INSTALLLOCATION,INSTALLDATE,PACKAGECACHE,DESCRIPTION | export-csv $path\installed_software.csv

   get-wmiobject win32_quickfixengineering | sort name | select-object HOTFIXID,DESCRIPTION,INSTALLEDON,INSTALLEDBY | export-csv $path\installed_hotfixes.csv

}

getwmiinfo