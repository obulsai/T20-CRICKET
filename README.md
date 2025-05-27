# 🏏 T20 Cricket Game on FPGA (Artix-7 Edge Board)

## 📘 Overview

This project implements a mini version of a T20 cricket game using Verilog HDL on the Artix-7 Edge FPGA development board (⏱️ 50 MHz clock). It simulates batting innings of two teams, generates random scores, and displays outputs on 7-segment displays and LEDs.

## 🎯 Features

- 🔁 Random score generation using LFSR (Linear Feedback Shift Register)
- 🔢 7-segment display output for:
  - 🏏 Team scores# 🏏 T20 Cricket Game on FPGA (Artix-7 Edge Board)

## 📘 Overview

This project implements a mini version of a T20 cricket game using Verilog HDL on the **Artix-7 Edge FPGA** development board (⏱️ 50 MHz clock). It simulates the batting innings of two teams, generates random scores using an LFSR, and displays real-time outputs on **7-segment displays** and **LEDs**.

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
- RTL schematic: `rtl_schematic.png`
- Simulation waveform: `simulation_waveform.png`

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

  - ⏳ Overs and balls
- 💡 LED indicators for:
  - ❌ Wickets
  - ✅ Overs completed
  - 🏆 Winning team
- 🔘 Start/reset button for game control
- ⏱️ Real-time T20 game simulation

## 🧩 Project Structure

### 🔝 Top Module: `t20_cricket_game.v`
- Integrates all modules
- Manages game state and display logic

### 📦 Modules

#### `lfsr.v`
- 🔄 8-bit LFSR for pseudo-random runs/wickets
- Tap configuration: [add if known]

#### `score_manager.v`
- 📈 Tracks runs, wickets, overs, innings
- ⚠️ Handles innings end and game transitions

#### `seven_seg_driver.v`
- 🧮 Converts binary to 7-segment format
- 📊 Displays score, overs, winner

#### `led_controller.v`
- 🔴 Red LED Scrolling : match winner 

#### `debounce.v`
- 🛠️ Debounces push button input

## 🖥️ Board Configuration

- Board: Artix-7 Edge
- Clock: 50 MHz (divided internally)
- 🔘 Input:
  - Push button (next ball/start)
- 🔢 Output:
  - 7-segment displays (score, overs)
  - LEDs (events and winner)

## 🧪 Simulation

- 🧾 Testbench: t20_cricket_tb.v
- ⚙️ Simulator: ModelSim / Vivado Simulator
- 🔍 Simulates LFSR, score progression, winner logic

📸 Images:
- RTL schematic: `rtl_schematic.png`
- Waveform: `simulation_waveform.png`

## 🎥 Demo

YouTube Video Link: [To be added here]

## ▶️ How to Run

1. 🔧 Synthesize the design using Vivado 2020.2+
2. 📤 Generate and program bitstream to Artix-7 Edge board
3. 🕹️ Press button to play each ball
4. 👀 View score, overs, and results on display and LEDs

## 🚀 Future Enhancements

- 🎳 Add bowling logic
- ⏲️ Real-time countdown per over
- 📟 UART/OLED display for commentary

## 👤 Author

**T. Obul Sai**  
ECE 3rd Year, RGUKT RK Valley
