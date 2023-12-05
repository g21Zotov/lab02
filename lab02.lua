#!/usr/bin/lua5.3


lgi = require("lgi")
math = require("math")

gtk = lgi.require ("Gtk","3.0")
gtk.init()

bld = gtk.Builder()
bld:add_from_file("lab02.glade")

ui = bld.objects
ui.my_window.title = "Zotov 21 lab02"

function add()
	a = tonumber(ui.txt_a.text)
	b = tonumber(ui.txt_b.text)
	ui.lbl_res.label = a + b
end

function subtract()
	a = tonumber(ui.txt_a.text)
	b = tonumber(ui.txt_b.text)
	ui.lbl_res.label = a - b
end

function multiply()
	a = tonumber(ui.txt_a.text)
	b = tonumber(ui.txt_b.text)
	ui.lbl_res.label = a * b
end

function divide()
	a = tonumber(ui.txt_a.text)
	b = tonumber(ui.txt_b.text)
	ui.lbl_res.label = a / b
end

function square()
	a = tonumber(ui.txt_a.text)
	b = tonumber(ui.txt_b.text)
	ui.lbl_res.label = a * a
end

function sin()
	a = tonumber(ui.txt_a.text)
	b = tonumber(ui.txt_b.text)
	ui.lbl_res.label = math.sin(a)
end

function ui.btn_pi:on_clicked()
	ui.lbl_res.label = math.pi
end

function ui.btn_e:on_clicked()
	ui.lbl_res.label = math.exp(tonumber(ui.txt_a.text))
end


ui.btn_add.on_clicked = add
ui.btn_subtract.on_clicked = subtract
ui.btn_multiply.on_clicked = multiply
ui.btn_divide.on_clicked = divide
ui.btn_square.on_clicked = square
ui.btn_sin.on_clicked = sin
tab = {}
tab['sin'] = sin
tab['gtk_main_quit'] = gtk.main_quit
bld:connect_signals(tab)

ui.my_window.on_destroy = gtk.main_quit
ui.my_window:show_all()

gtk.main()
