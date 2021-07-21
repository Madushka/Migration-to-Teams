#User already moved_to_Teams & TeamsOnly mode but changing back bulk to IslandMode 

#MoveUserlist.csv should listed all the users to convert and same folder with CSV format.

$Userlist = import-csv .\ConvertUserlist.csv
    ForEach ($Alluser in $Userlist)
    {
    Grant-CsTeamsUpgradePolicy -Identity $AllUser.SipAddress -PolicyName IslandsWithNotify -verbose
    }

