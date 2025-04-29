function restart-EventSession {
    param (
        [string] $eventSessionName,
        [string] $sqlInstance
    )

    $session = Get-DbaXESession -SqlInstance $sqlInstance -session $eventSessionName

    try {
        if ($session) {

            $null = Stop-DbaXESession -SqlInstance $sqlInstance -session $eventSessionName
            Write-Host "Extended Event Session [$eventSessionName] has been stopped."

        }

        Start-Sleep -Seconds 5

        $null = Start-DbaXESession -SqlInstance $sqlInstance -session $eventSessionName
        Write-Host "Extended Event Session [$eventSessionName] has been restarted."

    } catch {

        Write-Host "Error restarting session $eventSessionName"

    }
    
}