// filename = str("symbols/symbol_", i, ".svg");
filename = str("1.svg");

linear_extrude(5) {
    import("1.svg");
}