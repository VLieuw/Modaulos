{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 5,
			"revision" : 7,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 86.0, 199.0, 1061.0, 732.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 292.817929188410403, 836.987949848175049, 83.0, 22.0 ],
					"text" : "receive PlayH"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "spectroscope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 443.492533683776855, 995.0, 300.0, 100.0 ],
					"range" : [ 0.0, 1.399999976158142 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 42.0, 836.987949848175049, 75.0, 22.0 ],
					"text" : "receive Amp"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 160.151262521743774, 1052.0, 83.0, 22.0 ],
					"text" : "send~ ValveH"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 161.151262521743774, 229.987949848175049, 212.0, 22.0 ],
					"saved_object_attributes" : 					{
						"air-density" : 1.200000047683716,
						"air-pressure" : 0.0,
						"aperture-length" : 0.03999999910593,
						"front-angle" : 10.0,
						"front-area" : 0.000003200000037,
						"initial-position-in" : [ 0.000199999994948, 0.000500000023749 ],
						"name" : "ValveConnectionH",
						"under-area" : 0.000250000011874,
						"weight" : 1.0
					}
,
					"text" : "mlys.valve @name ValveConnectionH"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 288.151262521743774, 748.987949848175049, 133.0, 22.0 ],
					"saved_object_attributes" : 					{
						"dimension" : -1,
						"name" : "PlayH",
						"pathtofile" : "",
						"script" : "-- Modalys mlys.lua controller\n-- user script\n-- (psst!.. learn lua here! https://www.lua.org/manual/5.1/ )\n--\n\nrequire(\"tools\")\n\nfunction initialize()\n\r\n    -- Reference to the air pressure at the reed connection\r\n    AirPressure = get_ref(\"ValveConnectionH@air-pressure\")\r\n\r\n    -- References to the radii of the 7 tone holes\r\n    HoleH1Radius = get_ref(\"HoleH1@radius\")\r\n    HoleH2Radius = get_ref(\"HoleH2@radius\")\r\n    HoleH3Radius = get_ref(\"HoleH3@radius\")\r\n    HoleH4Radius = get_ref(\"HoleH4@radius\")\r\n    HoleH5Radius = get_ref(\"HoleH5@radius\")\r\n    HoleH6Radius = get_ref(\"HoleH6@radius\")\r\n    HoleH7Radius = get_ref(\"HoleH7@radius\")\r\n    HoleH8Radius = get_ref(\"HoleH8@radius\")\r\n    HoleH9Radius = get_ref(\"HoleH9@radius\")\nend\n\r\n-- Function to simulate blowing into the reed with dynamic pressure\r\nfunction blowInValve(dynamic)\r\n    if dynamic == nil then dynamic = 5 end\r\n    \r\n    -- Pressure envelope\r\n    local pressure = {\r\n        0.00, 0, \r\n\t\t0.10, 200,\r\n\t\t0.20, 500,\r\n\t\t0.30, 1000,\r\n\t\t0.40, 950,\r\n\t\t1.60, 900,\r\n\t\t2.20, 800,\r\n\t\t2.40, 600,\r\n\t\t2.60, 400,\r\n\t\t2.70, 0\r\n\t\t}\r\n   \r\n    for i = 1, #pressure - 1, 2 do\r\n        pressure[i + 1] = pressure[i + 1] * dynamic\r\n    end\r\n    apply_envelope(AirPressure, pressure)\r\nend\r\n\r\n\r\nfunction playPitch1(dynamic)\r\n    blowInValve(dynamic)\r\n    \r\n    -- Set all holes to closed for Pitch 1\r\n    set_value(HoleH1Radius, 0)\r\n    set_value(HoleH2Radius, 0)\r\n    set_value(HoleH3Radius, 0)\r\n    set_value(HoleH4Radius, 0)\r\n    set_value(HoleH5Radius, 0)\r\n    set_value(HoleH6Radius, 0)\r\n    set_value(HoleH7Radius, 0)\r\n    set_value(HoleH8Radius, 0)\r\n    set_value(HoleH9Radius, 0)\r\nend\r\n\r\nfunction playPitch2(dynamic)\r\n    blowInValve(dynamic)\r\n    \r\n    set_value(HoleH1Radius, 0.00305)\r\n    set_value(HoleH2Radius, 0)\r\n    set_value(HoleH3Radius, 0)\r\n    set_value(HoleH4Radius, 0)\r\n    set_value(HoleH5Radius, 0)\r\n    set_value(HoleH6Radius, 0)\r\n    set_value(HoleH7Radius, 0)\r\n    set_value(HoleH8Radius, 0)\r\n    set_value(HoleH9Radius, 0)\r\nend\r\n\r\nfunction playPitch3(dynamic)\r\n    blowInValve(dynamic)\r\n    \r\n    set_value(HoleH1Radius, 0.00305)\r\n    set_value(HoleH2Radius, 0.0031)\r\n    set_value(HoleH3Radius, 0)\r\n    set_value(HoleH4Radius, 0)\r\n    set_value(HoleH5Radius, 0)\r\n    set_value(HoleH6Radius, 0)\r\n    set_value(HoleH7Radius, 0)\r\n    set_value(HoleH8Radius, 0)\r\n    set_value(HoleH9Radius, 0)\r\nend\r\n\r\nfunction playPitch4(dynamic)\r\n    blowInValve(dynamic)\r\n    \r\n    set_value(HoleH1Radius, 0.00305)\r\n    set_value(HoleH2Radius, 0.0031)\r\n    set_value(HoleH3Radius, 0.0031)\r\n    set_value(HoleH4Radius, 0)\r\n    set_value(HoleH5Radius, 0)\r\n    set_value(HoleH6Radius, 0)\r\n    set_value(HoleH7Radius, 0)\r\n    set_value(HoleH8Radius, 0)\r\n    set_value(HoleH9Radius, 0)\r\nend\r\n\r\nfunction playPitch5(dynamic)\r\n    blowInValve(dynamic)\r\n    \r\n    set_value(HoleH1Radius, 0.00305)\r\n    set_value(HoleH2Radius, 0.00310)\r\n    set_value(HoleH3Radius, 0.0031)\r\n    set_value(HoleH4Radius, 0.00305)\r\n    set_value(HoleH5Radius, 0)\r\n    set_value(HoleH6Radius, 0)\r\n    set_value(HoleH7Radius, 0)\r\n    set_value(HoleH8Radius, 0)\r\n    set_value(HoleH9Radius, 0)\r\nend\r\n\r\nfunction playPitch6(dynamic)\r\n    blowInValve(dynamic)\r\n    \r\n    set_value(HoleH1Radius, 0.00305)\r\n    set_value(HoleH2Radius, 0.00310)\r\n    set_value(HoleH3Radius, 0.0031)\r\n    set_value(HoleH4Radius, 0.0030)\r\n    set_value(HoleH5Radius, 0.003125)\r\n    set_value(HoleH6Radius, 0)\r\n    set_value(HoleH7Radius, 0)\r\n    set_value(HoleH8Radius, 0)\r\n    set_value(HoleH9Radius, 0)\r\nend\r\n\r\nfunction playPitch7(dynamic)\r\n    blowInValve(dynamic)\r\n    \r\n    set_value(HoleH1Radius, 0.00305)\r\n    set_value(HoleH2Radius, 0.00310)\r\n    set_value(HoleH3Radius, 0.0031)\r\n    set_value(HoleH4Radius, 0.0030)\r\n    set_value(HoleH5Radius, 0.003125)\r\n    set_value(HoleH6Radius, 0.003)\r\n    set_value(HoleH7Radius, 0)\r\n    set_value(HoleH8Radius, 0)\r\n    set_value(HoleH9Radius, 0)\r\nend\r\n\r\nfunction playPitch8(dynamic)\r\n    blowInValve(dynamic)\r\n    \r\n    set_value(HoleH1Radius, 0.00305)\r\n    set_value(HoleH2Radius, 0.00310)\r\n    set_value(HoleH3Radius, 0.0031)\r\n    set_value(HoleH4Radius, 0.0030)\r\n    set_value(HoleH5Radius, 0.003125)\r\n    set_value(HoleH6Radius, 0.003)\r\n    set_value(HoleH7Radius, 0.003075)\r\n    set_value(HoleH8Radius, 0)\r\n    set_value(HoleH9Radius, 0)\r\nend\r\n\r\n\r\nfunction playPitch9(dynamic)\r\n    blowInValve(dynamic)\r\n    \r\n    set_value(HoleH1Radius, 0.00305)\r\n    set_value(HoleH2Radius, 0.0031)\r\n    set_value(HoleH3Radius, 0.0031)\r\n    set_value(HoleH4Radius, 0.0030)\r\n    set_value(HoleH5Radius, 0.003125)\r\n    set_value(HoleH6Radius, 0.0031)\r\n    set_value(HoleH7Radius, 0.003075)\r\n    set_value(HoleH8Radius, 0.003)\r\n    set_value(HoleH9Radius, 0)\r\nend\r\n\r\nfunction playPitch10(dynamic)\r\n    blowInValve(dynamic)\r\n    \r\n    set_value(HoleH1Radius, 0.00305)\r\n    set_value(HoleH2Radius, 0.0031)\r\n    set_value(HoleH3Radius, 0.0031)\r\n    set_value(HoleH4Radius, 0.0030)\r\n    set_value(HoleH5Radius, 0.003125)\r\n    set_value(HoleH6Radius, 0.0031)\r\n    set_value(HoleH7Radius, 0.003075)\r\n    set_value(HoleH8Radius, 0.003)\r\n    set_value(HoleH9Radius, 0.0036)\r\nend\r\n\r\n\nfunction update()\n\t-- This function (do not change its name!) is run according to the *update* parameter (0=every sample)\n\t-- Create your code here. The return value can be passed to a controller or a point-output.\n\t--\n\t--optional: you can return as many values (comma-separated) as there are outlets. Ex: \n\t--return x,y\nend",
						"target-attribute" : "none",
						"update" : 0.009999999776483
					}
,
					"text" : "mlys.lua @name PlayH"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgcolor2" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.788235294117647, 0.0, 0.8, 1.0 ],
					"bgfillcolor_color1" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "color",
					"gradient" : 1,
					"id" : "obj-28",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 679.373491883277893, 728.987949848175049, 184.0, 22.0 ],
					"text" : "luafunction PlayH playPitch10 12",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgcolor2" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.788235294117647, 0.0, 0.8, 1.0 ],
					"bgfillcolor_color1" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "color",
					"gradient" : 1,
					"id" : "obj-29",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 679.373491883277893, 752.987949848175049, 177.0, 22.0 ],
					"text" : "luafunction PlayH playPitch9 12",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 397.151262521743774, 562.987949848175049, 94.0, 36.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleH9",
						"noise" : 0.0,
						"radius" : 0.009999999776483,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleH9"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 371.817929188410403, 524.987949848175049, 94.0, 36.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleH8",
						"noise" : 0.0,
						"radius" : 0.009999999776483,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleH8"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 160.151262521743774, 1007.488422930240631, 78.0, 22.0 ],
					"text" : "normalize~ 1"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgcolor2" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.788235294117647, 0.0, 0.8, 1.0 ],
					"bgfillcolor_color1" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "color",
					"gradient" : 1,
					"id" : "obj-25",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 679.373491883277893, 777.987949848175049, 177.0, 22.0 ],
					"text" : "luafunction PlayH playPitch8 12",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgcolor2" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.788235294117647, 0.0, 0.8, 1.0 ],
					"bgfillcolor_color1" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "color",
					"gradient" : 1,
					"id" : "obj-26",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 679.373491883277893, 801.987949848175049, 177.0, 22.0 ],
					"text" : "luafunction PlayH playPitch7 10",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 594.651262521743774, 859.950892388820648, 29.0, 22.0 ],
					"text" : "thru"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgcolor2" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.788235294117647, 0.0, 0.8, 1.0 ],
					"bgfillcolor_color1" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "color",
					"gradient" : 1,
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 679.373491883277893, 825.987949848175049, 171.0, 22.0 ],
					"text" : "luafunction PlayH playPitch6 5",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgcolor2" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.788235294117647, 0.0, 0.8, 1.0 ],
					"bgfillcolor_color1" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "color",
					"gradient" : 1,
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 679.373491883277893, 849.987949848175049, 171.0, 22.0 ],
					"text" : "luafunction PlayH playPitch5 5",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgcolor2" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.788235294117647, 0.0, 0.8, 1.0 ],
					"bgfillcolor_color1" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "color",
					"gradient" : 1,
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 679.373491883277893, 873.987949848175049, 171.0, 22.0 ],
					"text" : "luafunction PlayH playPitch4 4",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgcolor2" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.788235294117647, 0.0, 0.8, 1.0 ],
					"bgfillcolor_color1" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "color",
					"gradient" : 1,
					"id" : "obj-7",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 679.373491883277893, 897.987949848175049, 171.0, 22.0 ],
					"text" : "luafunction PlayH playPitch3 2",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgcolor2" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.788235294117647, 0.0, 0.8, 1.0 ],
					"bgfillcolor_color1" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "color",
					"gradient" : 1,
					"id" : "obj-4",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 679.373491883277893, 947.488422930240631, 171.0, 22.0 ],
					"text" : "luafunction PlayH playPitch1 3",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 160.151262521743774, 923.987949848175049, 44.0, 22.0 ],
					"text" : "*~ 300"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"linecount" : 3,
					"maxclass" : "newobj",
					"numinlets" : 10,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 160.151262521743774, 656.987949848175049, 256.0, 50.0 ],
					"saved_object_attributes" : 					{
						"access-in-initial-position" : [ 0.0, 0.816999971866608, 0.703000009059906, 0.625999987125397, 0.58899998664856, 0.507000029087067, 0.446000009775162, 0.395000010728836, 0.360000014305115, 0.30799999833107 ],
						"access-out-initial-position" : [ 0.400000005960464 ],
						"air-density" : 1.200000047683716,
						"air-elasticity" : 0.000007208765965,
						"const-loss" : 1.0,
						"freq-loss" : 1.100000023841858,
						"length" : 0.402599990367889,
						"modes" : 50,
						"name" : "TubeH",
						"pitch" : 250.0,
						"pitch-parameter" : "length",
						"radius0" : 0.013000000268221,
						"radius1" : 0.014000000432134
					}
,
					"text" : "mlys.closed-open-tube 10 1 @name TubeH @length 0.4026 @radius0 0.0075 @radius1 0.0085"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-15",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 354.151262521743774, 1027.488422930240631, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "float", "float", "" ],
					"patching_rect" : [ 354.151262521743774, 985.987949848175049, 42.0, 22.0 ],
					"text" : "fzero~"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgcolor2" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.788235294117647, 0.0, 0.8, 1.0 ],
					"bgfillcolor_color1" : [ 0.781042098999023, 0.0, 0.789933025836945, 1.0 ],
					"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "color",
					"gradient" : 1,
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 679.373491883277893, 922.987949848175049, 174.0, 22.0 ],
					"text" : "luafunction PlayH playPitch2 2",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-117",
					"maxclass" : "gain~",
					"multichannelvariant" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 160.151262521743774, 969.987949848175049, 155.0, 18.0 ],
					"size" : 13,
					"varname" : "gain~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-112",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 345.484595855077146, 486.987949848175049, 94.0, 36.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleH7",
						"noise" : 0.0,
						"radius" : 0.009999999776483,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleH7"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-111",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 319.151262521743774, 448.987949848175049, 94.0, 36.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleH6",
						"noise" : 0.0,
						"radius" : 0.009999999776483,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleH6"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-110",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 292.817929188410403, 410.987949848175049, 94.0, 36.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleH5",
						"noise" : 0.0,
						"radius" : 0.009999999776483,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleH5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-109",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 266.484595855077089, 372.987949848175049, 94.0, 36.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleH4",
						"noise" : 0.0,
						"radius" : 0.009999999776483,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleH4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-108",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 242.151262521743774, 334.987949848175049, 94.0, 36.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleH3",
						"noise" : 0.0,
						"radius" : 0.009999999776483,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleH3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-107",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 213.817929188410432, 296.987949848175049, 94.0, 36.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleH2",
						"noise" : 0.0,
						"radius" : 0.009999999776483,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleH2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 160.151262521743774, 789.987949848175049, 81.0, 22.0 ],
					"saved_object_attributes" : 					{
						"name" : "Collector"
					}
,
					"text" : "mlys.collector"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 160.151262521743774, 721.987949848175049, 244.0, 22.0 ],
					"saved_object_attributes" : 					{
						"channel" : 1,
						"gain" : 20.0,
						"name" : "OutH"
					}
,
					"text" : "mlys.point-output @name OutH @channel 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 161.151262521743774, 192.987949848175049, 188.0, 22.0 ],
					"saved_object_attributes" : 					{
						"access-in-initial-position" : [ 0.0, 0.0 ],
						"access-in-type" : [ "trans0", "trans1" ],
						"access-out-initial-position" : [ 1.0, 1.0 ],
						"access-out-type" : [ "trans0", "tran1" ],
						"const-loss0" : 60.0,
						"const-loss1" : 60.0,
						"freq-loss0" : 250.0,
						"freq-loss1" : 250.0,
						"large-mass" : 0.000003000000106,
						"name" : "ValveH",
						"pitch" : 0.0,
						"pitch-parameter" : "mass",
						"small-mass" : 0.000001999999995,
						"stiffness0" : 200.0,
						"stiffness1" : 200.0
					}
,
					"text" : "mlys.bi-two-mass @name ValveH"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 187.484595855077089, 258.987949848175049, 94.0, 36.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleH1",
						"noise" : 0.0,
						"radius" : 0.009999999776483,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleH1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 161.151262521743774, 85.506463825702667, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 161.151262521743774, 118.802758932113647, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 161.151262521743774, 156.543498337268829, 178.0, 22.0 ],
					"saved_object_attributes" : 					{
						"name" : "PositionH",
						"position" : 0.0,
						"weight" : 1.0
					}
,
					"text" : "mlys.position @name PositionH"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 160.151262521743774, 824.950892388820648, 65.0, 22.0 ],
					"saved_object_attributes" : 					{
						"angle-mode" : "degree",
						"multi" : 0,
						"precision" : "double"
					}
,
					"text" : "mlys.script"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "" ],
					"patching_rect" : [ 160.151262521743774, 884.488422930240631, 70.0, 22.0 ],
					"saved_object_attributes" : 					{
						"precision" : ""
					}
,
					"text" : "modalys~ 1"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 2 ],
					"source" : [ "obj-107", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 3 ],
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 4 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 5 ],
					"source" : [ "obj-110", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 6 ],
					"source" : [ "obj-111", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 7 ],
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-117", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 1 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"order" : 1,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-117", 0 ],
					"order" : 2,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"order" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 9 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 8 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-117", 0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "mlys.bi-two-mass.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "mlys.closed-open-tube.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "mlys.collector.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "mlys.hole.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "mlys.lua.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "mlys.point-output.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "mlys.position.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "mlys.script.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "mlys.valve.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "modalys~.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "thru.maxpat",
				"bootpath" : "C74:/patchers/m4l/Pluggo for Live resources/patches",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
