function Get-LFMGeoTopArtist {
    [CmdletBinding()]
    [OutputType('PowerLFM.Geo.TopArtists')]
    param (
        [Parameter(Mandatory,
                   ValueFromPipeline,
                   ValueFromPipelineByPropertyName)]
        [string] $Country,

        [Parameter()]
        [ValidateRange(1,119)]
        [string] $Limit,

        [string] $Page
    )

    begin {
        #Default hashtable
        $apiParams = [ordered] @{
            'method' = 'geo.getTopArtists'
            'api_key' = $LFMConfig.APIKey
            'format' = 'json'
        }

        #Adding key/value to hashtable based off optional parameters
        switch ($PSBoundParameters.Keys) {
            'Limit' {$apiParams.add('limit', $Limit)}
            'Page' {$apiParams.add('page', $Page)}
        }
    }
    process {
        switch ($PSBoundParameters.Keys) {
            'Country' {$apiParams.add('country', $Country)}
        }
        #Building string to append to base url
        $keyValues = $apiParams.GetEnumerator() | ForEach-Object {
            "$($_.Name)=$($_.Value)"
        }
        $string = $keyValues -join '&'

        $apiUrl = "$baseUrl/?$string"
    }
    end {
        $irm = Invoke-RestMethod -Uri $apiUrl
        $hash = $irm | ConvertTo-Hashtable
        
        foreach ($artist in $hash.TopArtists.Artist) {
            $artistInfo = [pscustomobject] @{
                'Artist' = $artist.Name
                'Id' = $artist.Mbid
                'Url' = $artist.Url
                'Listeners' = [int] $artist.Listeners
                'ImageUrl' = $artist.Image.Where({$_.Size -eq 'ExtraLarge'}).'#text'
            }
    
            $artistInfo.PSObject.TypeNames.Insert(0, 'PowerLFM.Get.TopArtists')
            Write-Output $artistInfo
        }
    }
}
