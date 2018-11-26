#
# Module manifest for module 'PSGet_PowerLFM'
#
# Generated by: John Steele
#
# Generated on: 6/22/2018
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'PowerLFM.psm1'

# Version number of this module.
ModuleVersion = '0.1.5'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'c8d0461c-325b-4b14-bd9c-dd5fa57fafeb'

# Author of this module
Author = 'John Steele'

# Company or vendor of this module
CompanyName = 'Unknown'

# Copyright statement for this module
Copyright = '(c) 2018 John Steele. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Module to leverage the Last.fm API'

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Add-LFMAlbumTag', 'Add-LFMArtistTag', 'Add-LFMConfiguration', 
                    'Get-LFMAlbumInfo', 'Get-LFMAlbumTag', 'Get-LFMAlbumTopTag', 
                    'Get-LFMArtistCorrection', 'Get-LFMArtistInfo', 
                    'Get-LFMArtistSimilar', 'Get-LFMArtistTag', 'Get-LFMArtistTopAlbum', 
                    'Get-LFMArtistTopTag', 'Get-LFMArtistTopTrack', 
                    'Get-LFMChartTopArtist', 'Get-LFMChartTopTag', 'Get-LFMChartTopTrack', 
                    'Get-LFMConfiguration', 'Get-LFMGeoTopArtist', 'Get-LFMGeoTopTrack',
                    'Get-LFMUserArtistTrack', 'Get-LFMUserFriend', 'Get-LFMUserInfo', 
                    'Get-LFMUserLovedTrack', 'Get-LFMUserTopAlbum', 
                    'Get-LFMUserTopArtist', 'Get-LFMUserTopTag', 'Get-LFMUserTopTrack', 
                    'Get-LFMUserWeeklyAlbumChart', 'Get-LFMUserWeeklyArtistChart', 
                    'Get-LFMUserWeeklyChartList', 'Get-LFMUserWeeklyTrackChart', 
                    'Remove-LFMAlbumTag', 'Remove-LFMArtistTag', 'Request-LFMSession', 
                    'Request-LFMToken', 'Search-LFMAlbum', 'Search-LFMArtist', 
                    'Set-LFMTrackLove', 'Set-LFMTrackUnlove'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Last.FM','LastFM','API','Rest','Json'

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/camusicjunkie/PowerLFM'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}