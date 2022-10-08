svg="../../svg/id-layer-selection-test.svg";
module test(nr, pos) translate(pos) {
	difference() {
		children(0);
		translate([2, 2]) text(str(nr));
		children([1:$children - 1]);
	}
	%children([1:$children - 1]);
}
module show(c) color(c) offset(0.01) children();

test(1, [0, 0]) {
	show("red")    import(svg, layer="layer-1");
	show("green")  import(svg, layer="layer-2");
	show("yellow") import(svg, layer="stars");
	// not selected, group-1 is not a layer
	show("blue")   import(svg, layer="group-1");
}

test(2, [0, 60]) {
	show("red")    import(svg, id="id-layer-1");
	show("green")  import(svg, id="id-circle");
	show("yellow") import(svg, id="id-star-1");
	show("yellow") import(svg, id="id-star-2");
	show("blue")   import(svg, id="id-boxes");
}

test(3, [120, 0]) {
	show("red")    import(svg, id="id-rect-0");
	show("green")  import(svg, id="id-circle");
	show("yellow") import(svg, id="id-star-3");
	show("blue")   import(svg, id="id-group-1");
	show("cyan")   import(svg, id="id-rect-5");
}

test(4, [120, 60]) {
	show("red")    import(svg, id="id-rect-0");
	// not selected, layer not matching
	show("green")  import(svg, id="id-circle", layer="N/A");
	show("yellow") import(svg, id="id-star-3", layer="stars");
	// selected, empty string as layer is treated as not specified
	show("blue")   import(svg, id="id-group-1", layer="");
	// not selected, layer not matching
	show("cyan")   import(svg, id="id-group-2", layer="N/A");
}
