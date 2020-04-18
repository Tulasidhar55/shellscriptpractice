RED="\033[1;31m"
NC='\033[0m'
echo -e "${RED}***************BlockTrackAPI Deployment Process Started*******************"
echo -e "***************Finding existing processes on PORT 4200*******************${NC}"
kill -9 $(lsof -t -i:4200 -sTCP:LISTEN)
echo -e "${RED}***************Existing Running Process found and killed***************${NC}"
cd
rm -rf SupplyChainManagement_0.01
echo -e "${RED}***************Deleted Existing Source code Folder***************"
echo -e "***************Cloning Folder from GIT***************${NC}"
git clone https://dileepkumar0918:nioxm4riofgmtbvarpk7xmmyjcxonkk3mwpkkoex6ug2gljsluwq@dev.azure.com/dileepkumar0918/SupplyChainManagement_0.01/_git/SupplyChainManagement_0.01
echo -e "${RED}***************Source code downloaded from GIT. Navigating to Source code..***************${NC}"
cd SupplyChainManagement_0.01/angular-app
echo -e "${RED}***************Installing required Packages***************${NC}"
npm install
echo -e "${RED}***************Packages Installed***************"
echo -e "***************Deploying the App and running the process in Background.***************${NC}"
ng serve --host 172.30.11.178 &
