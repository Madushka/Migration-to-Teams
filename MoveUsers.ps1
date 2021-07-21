#MoveUser_to_Teams
#List_down_sipaddress_on_a_csv_named_it_MoveUserslist.csv and keep both files in same folder

#EnterpriseVoiceEnabled $False users with MoveUserslist.csv
#Makesure permission given correctly

$cr=Get-Credential

#provided account should have global admin or Teams admin & User Admin with SfB CSAdministrator permission 

$url="https://admin10.online.lync.com/HostedMigration/hostedmigrationService.svc"


#Add all the users SIP address which required to move to Teams

$Userlist = import-csv .\MoveUserslist.csv
    ForEach ($Alluser in $Userlist)
    {

    Move-CsUser -Identity $AllUser.SipAddress -Target "sipfed.online.lync.com" -ProxyPool "lyncpool.abc.com" -Credential $cr -HostedMigrationOverrideUrl $url -Verbose

    #Convert TeamsOnly

        Grant-CsTeamsUpgradePolicy -PolicyName UpgradeToTeams -Identity $AllUser.SipAddress -verbose

    #EnterpriseVoiceEnabled if you need to set remove # ta

    #Set-CsUser -identity $AllUser.SipAddress -EnterpriseVoiceEnabled $True -verbose


}


