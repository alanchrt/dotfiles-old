/* ***************
Desc: Installation script
Modified version of Chris Pederick installscript from WD.
Author: Jed Brown (jedbro@gmx.net)
Version: 0.5.x
Last modified: May 25th, 2004
 ****************** */
const author              = "Jan Dittmer";
const displayName         = "ShowIP";
const name                = "ipv6ident";
const version             = "0.8.19";
var contentFlag           = CONTENT | PROFILE_CHROME;
var error                 = null;
var folder                = getFolder("Profile", "chrome");
var localeFlag            = LOCALE | PROFILE_CHROME;
var skinFlag              = SKIN | PROFILE_CHROME;
var jarName               = name + ".jar";
var existsInApplication   = File.exists(getFolder(getFolder("chrome"), jarName));
var existsInProfile       = File.exists(getFolder(folder, jarName));
const SUCCESS_MESSAGE     = " can now be found under the Tools menu and in the statusbar. \n Please restart the application or open a new window for completion.";

initInstall(displayName, name, version);

// If the extension exists in the application folder or it doesn't exist in the profile folder and the user doesn't want it installed to the profile folder
if(existsInApplication || (!existsInProfile && !confirm("Do you want to install the extension into your profile folder?\n(Cancel will install into the application folder)")))
{
	contentFlag = CONTENT | DELAYED_CHROME;
	folder      = getFolder("chrome");
	localeFlag  = LOCALE | DELAYED_CHROME;
	skinFlag    = SKIN | DELAYED_CHROME;
}

setPackageFolder(folder);
error = addFile(author, version, 'chrome/' + jarName, folder, null);
/*
if (error == SUCCESS) {
	var iconfolder = getFolder(getFolder("chrome", "icons"), "default");
	//addFile(name, "ce-main.xpm", iconfolder, "");
	addFile(name, "quicknote-main.ico", iconfolder, "");
	addFile(name, "quicknote-main.xpm", iconfolder, "");
}
*/
// If adding the JAR file succeeded
if(error == SUCCESS)
{
	folder = getFolder(folder, jarName);
	registerChrome(contentFlag, folder, "content/");
	registerChrome(localeFlag, folder, "locale/en-US/showip/");
	/*
	registerChrome(localeFlag, folder, "locale/es-ES/");
	registerChrome(localeFlag, folder, "locale/ru-RU/");
	registerChrome(localeFlag, folder, "locale/sl-SI/");
	registerChrome(skinFlag, folder, "skin/classic/");
	*/

	error = performInstall();

	// If the install failed
	if(error == SUCCESS || error == 999)
	{
		alert(displayName+" "+version+" has been succesfully installed.\n"+displayName + SUCCESS_MESSAGE);
	}else{
		alert("Install failed. Error code:" + error);
		cancelInstall(error);
	}
}
else
{
	alert("The installation of the extension failed.\n" + error + "\n Failed to create " +jarName+ " \n"
			+"Make sure you have the correct permissions");
	cancelInstall(error);
}
