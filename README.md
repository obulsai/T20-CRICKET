# 🏏 T20 Cricket Game on FPGA (Artix-7 Edge Board)

## 📘 Overview

This project implements a mini version of a T20 cricket game using Verilog HDL on the **Artix-7 Edge FPGA** development board (⏱️ 50 MHz clock). It simulates the batting innings of two teams, generates random scores using an LFSR, and displays real-time outputs on **7-segment displays** and **LEDs**.

![Artix-7 Edge Board](https://github.com/obulsai/T20-CRICKET/blob/51dc8a1b9e119199edc973df80097adc92733b80/implementation/EDGE_FPGA)

## 🎯 Features

- 🔁 **Random score generation** using LFSR (Linear Feedback Shift Register)
- 🔢 7-segment display output for:
  - 🏏 Team scores
  - ⏳ Overs and balls
- 💡 LED indicators for:
  - ❌ Wickets
  - ✅ Overs completed
  - 🏆 Winning team (scrolling pattern)
- 🔘 Start/next-ball push-button for control
- ⏱️ Real-time T20 cricket match simulation

## 🧩 Project Structure

### 🔝 Top Module: `t20_cricket_game.v`
- Connects all submodules
- Manages game state transitions, display outputs, and user inputs

### 📦 Modules

#### `lfsr.v`
- 🔄 8-bit Linear Feedback Shift Register
- Generates pseudo-random numbers to simulate cricket events (runs or wickets)
- [Tap configuration to be added if known]

#### `score_manager.v`
- 📈 Keeps track of:
  - Runs
  - Wickets
  - Overs and balls
  - Inning status
- ⚠️ Handles game logic, innings switching, and winner detection

#### `seven_seg_driver.v`
- 🧮 Converts binary values to 7-segment display format
- 📊 Displays:
  - Team scores
  - Overs and balls
  - Winning team at match end

#### `led_controller.v`
- 🏆 LED scroll pattern to indicate **winning team**

#### `debounce.v`
- 🛠️ Debounces mechanical push-button input to avoid signal glitches

## 🖥️ Board Configuration

- **Board**: Artix-7 Edge FPGA  
  ![Artix-7 Board](https://github.com/obulsai/T20-CRICKET/blob/51dc8a1b9e119199edc973df80097adc92733b80/implementation/EDGE_FPGA)
- **Clock**: 50 MHz (divided internally)
- 🔘 **Input**:
  - Push button (for next ball / start)
- 🔢 **Output**:
  - 7-segment displays (score and overs)
  - LEDs (for wickets, overs, and winning team)

## 🧪 Simulation

- 🧾 **Testbench**: [`t20_cricket_tb.v`](https://github.com/obulsai/T20-CRICKET/blob/5330869aa6c7453d9851506dabc6b8fa8f53aea7/t20_cricket_tb.v)
- ⚙️ Simulated using: **ModelSim** or **Vivado Simulator**
- 🔍 Covers:
  - LFSR randomness
  - Game score transitions
  - Winning logic validation

📸 **Images**:
- 🧠 Score Generator View:  
  ![Score Generator](https://github.com/obulsai/T20-CRICKET/blob/303cb4524ee5b088c3775852c67f4e71efba9269/implementation/2_score_generate.jpeg)
- 🧩 Game Flow Design:  
  ![Game Flow](https://github.com/obulsai/T20-CRICKET/blob/303cb4524ee5b088c3775852c67f4e71efba9269/Module_designs/game_flow.jpeg)
- 🛠️ Elaborated RTL Design:  
  ![Elaborated Design](https://github.com/obulsai/T20-CRICKET/blob/303cb4524ee5b088c3775852c67f4e71efba9269/RTL/elaborated_design.jpeg)

## 🎥 Demo

YouTube Video Link: [To be added here]

## ▶️ How to Run

1. 🔧 Open the project in **Vivado 2020.2+**
2. 💻 Synthesize and implement the design
3. 📤 Generate bitstream and program to the **Artix-7 Edge** board
4. 🕹️ Press the push-button for each ball
5. 👀 Monitor:
   - Team scores and overs on 7-segment display
   - Game progress and result via LEDs

## 🚀 Future Enhancements

- 🎳 Add bowling logic to simulate bowler variation
- ⏲️ Include a countdown timer for over simulation
- 📟 UART or OLED display for live commentary and stats

## 👤 Author

**T. Obul Sai**  
ECE 3rd Year, RGUKT RK Valley
