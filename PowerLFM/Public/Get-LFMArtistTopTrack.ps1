function Get-LFMArtistTopTrack {
    [CmdletBinding(DefaultParameterSetName = 'artist')]
    [OutputType('PowerLFM.Artist.TopTrack')]
    param (
        [Parameter(Mandatory,
                   ValueFromPipelineByPropertyName,
                   ParameterSetName = 'artist')]
        [string] $Artist,

        [Parameter(ValueFromPipelineByPropertyName,
                   ParameterSetName = 'id')]
        [string] $Id,
        
        [Parameter()]
        [ValidateRange(1,50)]
        [string] $Limit,

        [string] $Page,
        [switch] $AutoCorrect
    )

    begin {
        #Default hashtable
        $apiParams = [ordered] @{
            'method' = 'artist.getTopTracks'
            'api_key' = $LFMConfig.APIKey
            'format' = 'json'
        }

        #Adding key/value to hashtable based off optional parameters
        switch ($PSBoundParameters.Keys) {
            'AutoCorrect' {$apiParams.add('autocorrect', 1)}
            'Limit' {$apiParams.add('limit', $Limit)}
            'Page' {$apiParams.add('page', $Page)}
        }
    }
    process {
        #Adding key/value to hashtable based off ParameterSetName
        switch ($PSCmdlet.ParameterSetName) {
            'artist' {$apiParams.add('artist', $Artist)}
            'id' {$apiParams.add('mbid', $Id)}
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
        
        $tracks = foreach ($track in $hash.TopTracks.Track) {
            $trackInfo = [pscustomobject] @{
                'Track' = $track.Name
                'Id' = $track.Mbid
                'Url' = $track.Url
                'Listeners' = $track.Listeners
                'PlayCount' = $track.PlayCount
            }
            $trackInfo.PSObject.TypeNames.Insert(0, 'PowerLFM.Artist.Track')
            Write-Output $trackInfo
        }

        $topTrackInfo = [pscustomobject] @{
            'Artist' = $hash.TopTracks.'@attr'.Artist
            'AlbumsPerPage' = $hash.TopTracks.'@attr'.PerPage
            'Page' = $hash.TopTracks.'@attr'.Page
            'TotalPages' = $hash.TopTracks.'@attr'.TotalPages
            'TotalAlbums' = $hash.TopTracks.'@attr'.Total
            'Tracks' = $tracks
        }

        $topTrackInfo.PSObject.TypeNames.Insert(0, 'PowerLFM.Artist.TopTrack')
        Write-Output $topTrackInfo
    }
}
