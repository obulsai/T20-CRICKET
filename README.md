# 🏏 T20 Cricket Game on FPGA (Artix-7 Edge Board)

## 📘 Overview

This project implements a mini version of a T20 cricket game using Verilog HDL on the Artix-7 Edge FPGA development board (⏱️ 50 MHz clock). It simulates batting innings of two teams, generates random scores, and displays outputs on 7-segment displays and LEDs.

## 🎯 Features

- 🔁 Random score generation using LFSR (Linear Feedback Shift Register)
- 🔢 7-segment display output for:
  - 🏏 Team scores
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
