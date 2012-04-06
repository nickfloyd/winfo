$here = Split-Path -Parent $MyInvocation.MyCommand.Path
    $sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
    . "$here\$sut"

    Describe "winfo_collector" {

        It "gets computer system details" {
			$expected = get-wmiobject win32_computersystem | sort Name | select-object Name, Model, Manufacturer, Description, DNSHostName, Domain, DomainRole, PartOfDomain, NumberOfProcessors, SystemType, TotalPhysicalMemory, UserName, Workgroup 
            $actual = get_win32_computersystem
			$actual.Name.should.be($expected.Name)
        }
		
		It "gets operating system details" {
			$expected = get-wmiobject win32_operatingsystem | sort Name | select-object Name, Version, FreePhysicalMemory, OSLanguage, OSProductSuite, OSType, ServicePackMajorVersion, ServicePackMinorVersion
            $actual = get_win32_operatingsystem
			$actual.Version.should.be($expected.Version)
        }
		
		It "gets logical disk details" {
			$expected = get-wmiobject win32_logicaldisk | sort Name | select-object Name, Description, Size, FreeSpace, FileSystem, VolumeName, VolumeSerialNumber, QuotaDisabled
            $actual = get_win32_logicaldisk
			$actual[0].Name.should.be($expected[0].Name)
        }
		
		It "gets physical memory details" {
			$expected = get-wmiobject win32_physicalmemory | sort Name | select-object Name, Capacity, DeviceLocator, Tag
            $actual = get_win32_physicalmemory
			$actual.Count.should.be($expected.Count)
        }

		It "gets process details" {
			$expected = get-wmiobject win32_process | sort Name | select-object Name, ProcessID, Handel, VM, WS, UserModeTime, KernelModeTime, PageFaults, PageFileUsage, CommandLine, ExecutablePath
            $actual = get_win32_process
			$actual.Count.should.be($expected.Count)
        }
		
		It "gets service details" {
			$expected = get-wmiobject win32_service | sort Name | select-object Name, Started, StartMode, State, PathName, ProcessID, Status, ExitCode, AcceptStop, AcceptPause, Description
            $actual = get_win32_service
			$actual.Count.should.be($expected.Count)
        }
		
		It "gets installed products details" {
			$expected = get-wmiobject win32_product | sort Name | select-object Name, Version, Vendor, InstallLocation, InstallDate, PackageCache, Description
            $actual = get_win32_product
			$actual.Count.should.be($expected.Count)
        }
		
		It "gets hotfixes details" {
			$expected = get-wmiobject win32_quickfixengineering | sort Name | select-object HotfixID, Description, InstalledOn, InstalledBy
            $actual = get_win32_quickfixengineering
			$actual.Count.should.be($expected.Count)
        }
    }
