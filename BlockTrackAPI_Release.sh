RED="\033[1;31m"
NC='\033[0m'
echo -e "${RED}***************BlockTrackAPI Deployment Process Started*******************"
echo -e "***************Finding existing processes on PORT 8081*******************${NC}"
kill -9 $(lsof -t -i:8081 -sTCP:LISTEN)
echo -e "${RED}***************Existing Running Process found and killed***************${NC}"
cd
rm -rf BlockTrackAPI
echo -e "${RED}***************Deleted Existing Source code Folder***************"
echo -e "***************Cloning Folder from GIT***************${NC}"
git clone https://tulasidharsalla:eb5yhgliy7rdgjsztwjgmmjzt5m6vkzfd7lgqpkbpt76i65osfea@dev.azure.com/tulasidharsalla/BlockTrackAPI/_git/BlockTrackAPI
echo -e "${RED}***************Source code downloaded from GIT. Navigating to Source code..***************${NC}"
cd BlockTrackAPI
echo -e "${RED}***************Installing required Packages***************${NC}"
npm install
echo -e "${RED}***************Packages Installed***************"
echo -e "***************Deploying the App and running the process in Background.***************${NC}"
node server.js &
