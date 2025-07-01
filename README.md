# ✅ RISC-V 5-Stage Pipelined Processor

A modular **5-stage pipelined** RISC-V processor implementing the **RV32I** instruction set. Designed in Verilog and verified through simulation using **Icarus Verilog** and **GTKWave**. This project showcases the pipelined CPU architecture that mirrors real-world performance improvements, while remaining easy to understand and extend. 🚀

---

## 📌 Pipeline Overview

This design follows the standard 5 pipeline stages:

1. **Fetch (IF)** – Instruction is fetched from memory.
2. **Decode (ID)** – Instruction is decoded; registers are read.
3. **Execute (EX)** – ALU performs computation or address calculation.
4. **Memory (MEM)** – Memory read/write operations.
5. **Write Back (WB)** – Final result written to register file.

Each stage is separated using pipeline registers: `IF/ID`, `ID/EX`, `EX/MEM`, and `MEM/WB`. These ensure correct data propagation per clock cycle.

---

## 🎯 Features

- ✅ **RV32I Instruction Set** – Supports base integer instructions (R/I/S/B-types).
- 🧩 **Fully Modular Design** – Each stage and register file implemented as a separate module.
- ⛓️ **Pipelined Architecture** – Parallel instruction execution across clock cycles.
- 📦 **Instruction & Data Memory** – Supports memory access via LW and SW.
- 🧪 **Testbench** – Simulates 14 instruction cases ensuring functional pipeline behavior.
- ⚠️ **No Hazard Detection (Yet)** – Instruction order avoids hazards to simplify verification.

---

## 🔧 Modules Included

- 📜 `Fetch.v`, `Decode.v`, `Execute.v`, `Memory.v`, `WriteBack.v`
- 📜 `IF_ID.v`, `ID_EX.v`, `EX_MEM.v`, `MEM_WB.v` – Pipeline registers
- 📜 `Top.v` – Complete integration of pipeline stages
- 🧪 `Top_tb.v` – Comprehensive testbench (no hazards)

---

## 🚀 Getting Started

### 📦 Prerequisites

- **VS Code** ✍️ (with [Verilog-HDL](https://marketplace.visualstudio.com/items?itemName=mshr-h.VerilogHDL) extension)
- **Icarus Verilog** 🖥️
- **GTKWave** 📊

### 🛠️ Setup

```bash
git clone https://github.com/<your-username>/RISCV-Pipelined-Core.git
cd RISCV-Pipelined-Core


- Compile and Simulate
  ```bash
    iverilog -o top_sim.vvp Top.v Top_tb.v
    vvp top_sim.vvp


- View Waveform
  ```bash
    gtkwave waveform.vcd

# 🌊 Example Waveform

<img width="959" alt="waveform" src="https://github.com/user-attachments/assets/1468b4b7-221b-4a55-a990-3ebd3c1cae78" />


# 📜 License
- This project is licensed under the MIT License – free to use, modify, and share! 😊

# 🙌 Acknowledgments
- Built with ❤️ by Ashar.
- Powered by the RISC-V open-source ISA and Verilog’s flexibility.

# 📢 Stay Tuned!

- Exciting updates are on the way as this project evolves with new features, optimizations and enhancements (like forwarding, hazard detection, hazard resolution, CSR support and more). Follow the repository for the latest developments!
