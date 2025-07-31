# 🔁 0110 Sequence Detector (Mealy and Moore FSM)

This Verilog project implements a **4-bit sequence detector** for the binary pattern `0110` using both **Mealy** and **Moore** Finite State Machines (FSMs). The system outputs `z = 1` when the input sequence matches `0110`.

---

## 📌 Overview

Finite State Machines (FSMs) are used in digital logic design to model sequential logic. This project demonstrates:
- The **difference** between Mealy and Moore machines.
- How to **detect a binary pattern** (0110) in a serial input stream.
- How to write **testbenches** and generate **waveforms** for debugging.

---

## 🧠 FSM Designs

### ✅ Mealy Machine
- Output depends on the **current state and input**.
- Generally responds **faster** to input changes.

### ✅ Moore Machine
- Output depends **only on the current state**.
- Requires **an extra state** to finalize the pattern match.

---

## 🧪 Simulation and Testbench

A common testbench is used to:
- Simulate the FSM behavior.
- Toggle inputs to test for correct detection.
- Generate output waveform `.vcd` file for GTKWave.

**Features:**
- Reset applied initially and in between tests
- Sequence inputs including overlapping patterns

---
<img width="961" height="281" alt="image" src="https://github.com/user-attachments/assets/c76682dc-b579-4021-a7c5-59269a543aad" />

