#Once you moved users to Teams to assign respective policy to users 
#Policy name will need to change depend on the environment

$Userlist = import-csv .\Userslist.csv
    ForEach ($u in $Userlist)
    {

        #if this EnterpriseVoice not set it will set by following command and also hostedvoicemail assuming users having ExchangeOnline mailbox 
        Set-CsUser -Identity $u.SipAddress -EnterpriseVoiceEnabled $true -HostedVoiceMail $true -Verbose

        Grant-CsOnlineVoiceRoutingPolicy -Identity $u.SipAddress -PolicyName “SIN_International” -Verbose
        Grant-CsTenantDialPlan -Identity $u.SipAddress -PolicyName “SIN” -Verbose 
        Grant-CsTeamsCallingPolicy -PolicyName Tag:AllowCalling -Identity $u.SipAddress -verbose

        }
        