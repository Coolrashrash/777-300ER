fmsPages["IDENT"]=createPage("IDENT")
--dofile("activepages/version.lua")

fmsPages["IDENT"].getPage=function(self,pgNo,fmsID)--dynamic pages need to be this way
	local nav_data_from_month = string.sub(B777DR_srcfms[fmsID][5],3,5)
	local nav_data_from_day = string.sub(B777DR_srcfms[fmsID][5],1,2)
	local nav_data_to_month = string.sub(B777DR_srcfms[fmsID][5],11,13)
	local nav_data_to_day = string.sub(B777DR_srcfms[fmsID][5],9,10)
	local nav_data_yr = string.sub(B777DR_srcfms[fmsID][5],14,15)
	--simConfigData["data"].FMC.active = string.format("%s%s%s%s/%s", nav_data_from_month, nav_data_from_day, nav_data_to_month, nav_data_to_day, nav_data_yr)
	local navdata = string.format("%s%s%s%s/%s", nav_data_from_month, nav_data_from_day, nav_data_to_month, nav_data_to_day, nav_data_yr)
	local monthTable = {
		JAN = "1",
		FEB = "2",
		MAR = "3",
		APR = "4",
		MAY = "5",
		JUN = "6",
		JUL = "7",
		AUG = "8",
		SEP = "9",
		OCT = "10",
		NOV = "11",
		DEC = "12"
	}
	local airac = "AIRAC-"..nav_data_yr..monthTable[nav_data_to_month]
	--simConfigData["data"].FMC.op_program = fmcVersion
    return{

		"       IDENT            ",
		"                        ",
		"777.300.1      GE90-115L",
		"                        ",
		airac.." "..navdata,
		"                        ",
		"                        ",
		"                        ",
		--simConfigData["data"].FMC.op_program.."       ",
		"                        ",
		"                        ",
		"               "..simConfigData["data"].FMC.drag_ff,
		"------------------------",
		"<INDEX         POS INIT>"
	}
end

fmsPages["IDENT"]["templateSmall"]={
	"                        ",
	" MODEL           ENGINES",
	"                        ",
	" NAV DATA         ACTIVE",
	"                        ",
	"                        ",
	"                        ",
	--" OP PROGRAM             ",
	"                        ",
	"                        ",
	"                 DRAG/FF",
	"                        ",
	"                        ",
	"                        "
}

fmsFunctionsDefs["IDENT"]={}
fmsFunctionsDefs["IDENT"]["L6"]={"setpage","INITREF"}
fmsFunctionsDefs["IDENT"]["R6"]={"setpage","POSINIT"}