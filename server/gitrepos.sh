path=`which git`
if [ $path != "/usr/bin/git" ]
then
echo "git is not installed, dnf or apt?"
read answer
if [ $answer == "dnf" ]
then
echo "Installing git"
sudo dnf install git -y
elif [ $answer == "apt" ]
then
echo "Installing git"
sudo apt install git -y 
fi 
fi

git clone https://github.com/TheFinalJoke/shellscript.git

git clone https://github.com/TheFinalJoke/Python.git

git clone https://github.com/junegunn/fzf.git

exit 0