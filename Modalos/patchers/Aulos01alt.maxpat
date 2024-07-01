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
		"rect" : [ 161.0, 159.0, 648.0, 730.0 ],
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
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 231.777770638465881, 967.0, 81.0, 22.0 ],
					"text" : "send~ ValveL"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 381.304869413375854, 746.500473082065582, 81.0, 22.0 ],
					"text" : "receive PlayL"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 104.0, 767.0, 75.0, 22.0 ],
					"text" : "receive Amp"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 232.777770638465881, 307.0, 210.0, 22.0 ],
					"saved_object_attributes" : 					{
						"air-density" : 1.200000047683716,
						"air-pressure" : 0.0,
						"aperture-length" : 0.041999999433756,
						"front-angle" : 10.0,
						"front-area" : 0.00000399999999,
						"initial-position-in" : [ 0.000199999994948, 0.000500000023749 ],
						"name" : "ValveConnectionL",
						"under-area" : 0.000250000011874,
						"weight" : 1.0
					}
,
					"text" : "mlys.valve @name ValveConnectionL"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "spectroscope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 497.492533683776855, 881.0, 300.0, 100.0 ],
					"range" : [ 0.0, 1.399999976158142 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"linecount" : 3,
					"maxclass" : "newobj",
					"numinlets" : 8,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 231.777770638465881, 556.0, 260.0, 50.0 ],
					"saved_object_attributes" : 					{
						"access-in-initial-position" : [ 0.0, 0.861000001430511, 0.810999989509583, 0.712000012397766, 0.638000011444092, 0.592999994754791, 0.505999982357025, 0.446999996900558 ],
						"access-out-initial-position" : [ 0.400000005960464 ],
						"air-density" : 1.200000047683716,
						"air-elasticity" : 0.00007000000187,
						"const-loss" : 1.0,
						"freq-loss" : 1.100000023841858,
						"length" : 0.402999997138977,
						"modes" : 50,
						"name" : "TubeL",
						"pitch" : 215.0,
						"pitch-parameter" : "length",
						"radius0" : 0.013000000268221,
						"radius1" : 0.014000000432134
					}
,
					"text" : "mlys.closed-open-tube 8 1 @name TubeL @length 0.403 @radius0 0.0077 @radius1 0.0088"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 232.777770638465881, 261.518505454063416, 186.0, 22.0 ],
					"saved_object_attributes" : 					{
						"access-in-initial-position" : [ 0.0, 0.0 ],
						"access-in-type" : [ "trans0", "trans1" ],
						"access-out-initial-position" : [ 1.0, 1.0 ],
						"access-out-type" : [ "trans0", "trans1" ],
						"const-loss0" : 60.0,
						"const-loss1" : 60.0,
						"freq-loss0" : 250.0,
						"freq-loss1" : 250.0,
						"large-mass" : 0.000003000000106,
						"name" : "ValveL",
						"pitch" : 0.0,
						"pitch-parameter" : "mass",
						"small-mass" : 0.000001999999995,
						"stiffness0" : 200.0,
						"stiffness1" : 200.0
					}
,
					"text" : "mlys.bi-two-mass @name ValveL"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 231.777770638465881, 918.500473082065582, 78.0, 22.0 ],
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
					"patching_rect" : [ 583.223878622055054, 620.664660513401031, 175.0, 22.0 ],
					"text" : "luafunction PlayL playPitch8 4",
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
					"patching_rect" : [ 601.880594372749329, 644.664660513401031, 175.0, 22.0 ],
					"text" : "luafunction PlayL playPitch7 12",
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
					"patching_rect" : [ 566.706342067037326, 740.664660513401031, 29.0, 22.0 ],
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
					"patching_rect" : [ 629.492533683776855, 668.664660513401031, 168.0, 22.0 ],
					"text" : "luafunction PlayL playPitch6 9",
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
					"patching_rect" : [ 650.388055324554443, 692.664660513401031, 168.0, 22.0 ],
					"text" : "luafunction PlayL playPitch5 9",
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
					"patching_rect" : [ 672.776114225387573, 716.664660513401031, 168.0, 22.0 ],
					"text" : "luafunction PlayL playPitch4 3",
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
					"patching_rect" : [ 696.179098606109619, 740.664660513401031, 168.0, 22.0 ],
					"text" : "luafunction PlayL playPitch3 3",
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
					"patching_rect" : [ 725.014918327331543, 788.664660513401031, 168.0, 22.0 ],
					"text" : "luafunction PlayL playPitch1 3",
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
					"patching_rect" : [ 231.777770638465881, 835.0, 44.0, 22.0 ],
					"text" : "*~ 300"
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
					"patching_rect" : [ 401.804869413375854, 918.500473082065582, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "float", "float", "" ],
					"patching_rect" : [ 401.804869413375854, 881.0, 42.0, 22.0 ],
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
					"patching_rect" : [ 715.358202576637268, 764.664660513401031, 168.0, 22.0 ],
					"text" : "luafunction PlayL playPitch2 3",
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
					"patching_rect" : [ 231.777770638465881, 881.0, 155.0, 18.0 ],
					"size" : 13,
					"varname" : "gain~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-112",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 472.777770638465881, 521.0, 146.0, 22.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleL7",
						"noise" : 0.0,
						"radius" : 0.009999999776483,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleL7"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-111",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 438.349199209894437, 497.0, 146.0, 22.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleL6",
						"noise" : 0.0,
						"radius" : 0.0,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleL6"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-110",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 403.920627781322992, 473.0, 146.0, 22.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleL5",
						"noise" : 0.0,
						"radius" : 0.0,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleL5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-109",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 369.492056352751604, 449.0, 146.0, 22.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleL4",
						"noise" : 0.0,
						"radius" : 0.0,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleL4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-108",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 335.063484924180159, 425.0, 146.0, 22.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleL3",
						"noise" : 0.0,
						"radius" : 0.0,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleL3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-107",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 300.634913495608771, 401.0, 146.0, 22.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleL2",
						"noise" : 0.0,
						"radius" : 0.0,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleL2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 231.777770638465881, 701.0, 81.0, 22.0 ],
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
					"patching_rect" : [ 231.777770638465881, 624.0, 242.0, 22.0 ],
					"saved_object_attributes" : 					{
						"channel" : 1,
						"gain" : 20.0,
						"name" : "OutL"
					}
,
					"text" : "mlys.point-output @name OutL @channel 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 266.206342067037326, 377.0, 146.0, 22.0 ],
					"saved_object_attributes" : 					{
						"name" : "HoleL1",
						"noise" : 0.0,
						"radius" : 0.0,
						"weight" : 1.0
					}
,
					"text" : "mlys.hole @name HoleL1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 255.277770638465881, 658.0, 131.0, 22.0 ],
					"saved_object_attributes" : 					{
						"dimension" : -1,
						"name" : "PlayL",
						"pathtofile" : "",
						"script" : "require(\"tools\")\r\n\r\nfunction initialize()\r\n\r\n    -- Reference to the air pressure at the reed connection\r\n    AirPressure = get_ref(\"ValveConnectionL@air-pressure\")\r\n\r\n    -- References to the radii of the 7 tone holes\r\n    HoleL1Radius = get_ref(\"HoleL1@radius\")\r\n    HoleL2Radius = get_ref(\"HoleL2@radius\")\r\n    HoleL3Radius = get_ref(\"HoleL3@radius\")\r\n    HoleL4Radius = get_ref(\"HoleL4@radius\")\r\n    HoleL5Radius = get_ref(\"HoleL5@radius\")\r\n    HoleL6Radius = get_ref(\"HoleL6@radius\")\r\n    HoleL7Radius = get_ref(\"HoleL7@radius\")\r\nend\r\n\r\n-- Function to simulate blowing into the reed with dynamic pressure\r\nfunction blowInValve(dynamic)\r\n    if dynamic == nil then dynamic = 4 end\r\n    \r\n    -- Pressure envelope\r\n    local pressure = {\r\n        0.00, 0, \r\n\t\t0.10, 200,\r\n\t\t0.20, 500,\r\n\t\t0.30, 1000,\r\n\t\t0.40, 950,\r\n\t\t1.60, 900,\r\n\t\t2.20, 800,\r\n\t\t2.40, 600,\r\n\t\t2.60, 400,\r\n\t\t2.70, 0\r\n\t\t}\r\n   \r\n    for i = 1, #pressure - 1, 2 do\r\n        pressure[i + 1] = pressure[i + 1] * dynamic\r\n    end\r\n    apply_envelope(AirPressure, pressure)\r\nend\r\n\r\n\r\nfunction playPitch1(dynamic)\r\n   \r\n    -- Set all holes to closed for Pitch 1\r\n    set_value(HoleL1Radius, 0)\r\n    set_value(HoleL2Radius, 0)\r\n    set_value(HoleL3Radius, 0)\r\n    set_value(HoleL4Radius, 0)\r\n    set_value(HoleL5Radius, 0)\r\n    set_value(HoleL6Radius, 0)\r\n    set_value(HoleL7Radius, 0)\r\n    blowInValve(dynamic)\r\nend\r\n\r\nfunction playPitch2(dynamic)\r\n\r\n    \r\n    set_value(HoleL1Radius, 0.00295)\r\n    set_value(HoleL2Radius, 0)\r\n    set_value(HoleL3Radius, 0)\r\n    set_value(HoleL4Radius, 0)\r\n    set_value(HoleL5Radius, 0)\r\n    set_value(HoleL6Radius, 0)\r\n    set_value(HoleL7Radius, 0)\r\n    blowInValve(dynamic)\r\nend\r\n\r\nfunction playPitch3(dynamic)\r\n\r\n    \r\n    set_value(HoleL1Radius, 0.00295)\r\n    set_value(HoleL2Radius, 0.00295)\r\n    set_value(HoleL3Radius, 0)\r\n    set_value(HoleL4Radius, 0)\r\n    set_value(HoleL5Radius, 0)\r\n    set_value(HoleL6Radius, 0)\r\n    set_value(HoleL7Radius, 0)\r\n    blowInValve(dynamic)\r\nend\r\n\r\nfunction playPitch4(dynamic)\r\n   \r\n    set_value(HoleL1Radius, 0.00295)\r\n    set_value(HoleL2Radius, 0.00295)\r\n    set_value(HoleL3Radius, 0.0031)\r\n    set_value(HoleL4Radius, 0)\r\n    set_value(HoleL5Radius, 0)\r\n    set_value(HoleL6Radius, 0)\r\n    set_value(HoleL7Radius, 0)\r\n    blowInValve(dynamic) \r\n\r\nend\r\n\r\nfunction playPitch5(dynamic)\r\n\r\n    \r\n    set_value(HoleL1Radius, 0.00295)\r\n    set_value(HoleL2Radius, 0.00295)\r\n    set_value(HoleL3Radius, 0.0031)\r\n    set_value(HoleL4Radius, 0.0031)\r\n    set_value(HoleL5Radius, 0)\r\n    set_value(HoleL6Radius, 0)\r\n    set_value(HoleL7Radius, 0)\r\n    blowInValve(dynamic)\r\nend\r\n\r\nfunction playPitch6(dynamic)\r\n\r\n    \r\n    set_value(HoleL1Radius, 0.00295)\r\n    set_value(HoleL2Radius, 0.00295)\r\n    set_value(HoleL3Radius, 0.0031)\r\n    set_value(HoleL4Radius, 0.0031)\r\n    set_value(HoleL5Radius, 0.0031)\r\n    set_value(HoleL6Radius, 0)\r\n    set_value(HoleL7Radius, 0)\r\n    blowInValve(dynamic)\r\nend\r\n\r\nfunction playPitch7(dynamic)\r\n\r\n    \r\n    set_value(HoleL1Radius, 0.00295)\r\n    set_value(HoleL2Radius, 0.00295)\r\n    set_value(HoleL3Radius, 0.0031)\r\n    set_value(HoleL4Radius, 0.0031)\r\n    set_value(HoleL5Radius, 0.0031)\r\n    set_value(HoleL6Radius, 0.0031)\r\n    set_value(HoleL7Radius, 0)\r\n    blowInValve(dynamic)\r\nend\r\n\r\nfunction playPitch8(dynamic)\r\n\r\n    \r\n    set_value(HoleL1Radius, 0.00295)\r\n    set_value(HoleL2Radius, 0.00295)\r\n    set_value(HoleL3Radius, 0.0031)\r\n    set_value(HoleL4Radius, 0.0031)\r\n    set_value(HoleL5Radius, 0.0031)\r\n    set_value(HoleL6Radius, 0.0031)\r\n    set_value(HoleL7Radius, 0.0031)\r\n    blowInValve(dynamic)\r\nend\r\n\r\n\r\nfunction update()\r\n\t-- This function (do not change its name!) is run according to the *update* parameter (0=every sample)\r\n\t-- Create your code here. The return value can be passed to a controller or a point-output.\r\n\t--\r\n\t--optional: you can return as many values (comma-separated) as there are outlets. Ex: \r\n\t--return x,y\r\nend",
						"target-attribute" : "none",
						"update" : 0.009999999776483
					}
,
					"text" : "mlys.lua @name PlayL"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 232.777770638465881, 153.518513977527618, 58.0, 22.0 ],
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
					"patching_rect" : [ 232.777770638465881, 186.814809083938599, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 232.777770638465881, 224.555548489093781, 176.0, 22.0 ],
					"saved_object_attributes" : 					{
						"name" : "PositionL",
						"position" : 0.0,
						"weight" : 1.0
					}
,
					"text" : "mlys.position @name PositionL"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 231.777770638465881, 735.962942540645599, 65.0, 22.0 ],
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
					"patching_rect" : [ 231.777770638465881, 795.500473082065582, 70.0, 22.0 ],
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
					"source" : [ "obj-12", 0 ]
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
					"destination" : [ "obj-27", 0 ],
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
					"destination" : [ "obj-3", 0 ],
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
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-30", 0 ]
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
