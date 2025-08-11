# Synchronous RAM in Verilog

## 📌 Description
This project implements a simple synchronous RAM with:
- Synchronous read and write on the clock's rising edge
- Parameterized data width and address width

## 🛠 Files
- `sync_ram.v` — Main RAM module
- `tb_sync_ram.v` — Testbench for simulation

## ▶️ Simulation
Run the following commands (Icarus Verilog):
```bash
iverilog -o ram_test sync_ram.v tb_sync_ram.v
vvp ram_test
gtkwave ram.vcd
```
