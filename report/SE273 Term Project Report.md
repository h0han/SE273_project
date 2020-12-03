# SE273 Term Project Report

### 13조(201911189 한현영, 201911127 이승우)

 

## I. Introduction

### A. 목적

​	본 프로젝트의 궁극적인 목적은 다양한 ALU를 구현하는데 있다. Adder Subtractor, Multiplier를 그 목적에 맞게 Combinational, Sequential logic / Hierarchical design / Synchronous design과 같이 다양한 방식으로 설계한다. 이후 test bench를 작성하여 고안한 logic이 설계 목적에 맞는지, input 대비 output이 정상적으로 도출되는지에 대해 검증하는 과정을 거친다.

 

### B. 목표 및 기준 설정

|           목표            |                             기준                             |
| :-----------------------: | :----------------------------------------------------------: |
|      Adder 정상 작동      | Testbench 내 임의의 두 8bits operand 간의 가산이 정상적으로 작동하는지 검증한다. (e.g. `00000110 + 00001101 = 00010011`) |
|   Subtractor 정상 작동    | Testbench 내 임의의 두 8bits operand 간의 감산이 정상적으로 작동하는지 검증한다. (e.g. `00000110 - 11110011 = 00010011`) |
|   Multiplier 정상 작동    | Testbench 내 임의의 두 8bits operand 간의 감산이 정상적으로 작동하는지 검증한다. (e.g. `00001111 * 00001010 = 10010110`) |
| 전체적인  state 정상 작동 | Testbench 내 임의의 두 8bits operand 가산, 감산, 곱셈이 정상적으로 작동하는지 검증한다. 더불어 여러 signal(`SYS_CLK`, `SYS_RESET_B`, `OP_CODE` 등)에 logic이 정상적으로 대응하는지 관찰한다. 또한 `DATA_A`, `DATA_B`에 대한 `DATA_C` 가 정상적으로 출력되는지 관찰한다. |

 

### C. 팀원간 역할

|     이름(학번)     |                             역할                             |
| :----------------: | :----------------------------------------------------------: |
| 한현영 (201911189) | SM diagram design / Adder(Subtractor), Top calculator,  Testbench implementation / code version management(Git) |
| 이승우(201911127)  |                                                              |

 

## II. Compose and Analysis

### A. State Diagram

### B. 시뮬레이션을 통한 모듈 검증

 

## III. Result and Discussion

### A. 결과 도출

### B. 토의

#### i. 제시된 주요 설계요소 및 제한요소를 만족하는가

1. VHDL의 세 가지 표현 방식인 Structural Description, Behavioral Description, Data Flow Description의 방법을 모두 사용하여 설계하였는가

2. Shift and add algorithm에 의해 SM chart를 작성한 후 multiplier를 설계하였는가

3. 설계한 Adder, Subtractor, Multiplier가 부호를 고려하는가

 

#### ii. Top-down 방식의 설계가 적용되었는가

#### iii. Hierarchical Design 방식의 설계가 적용되었는가

#### iv. Synchronous Design 방식의 설계가 적용되었는가

#### v. Testbench의 작성 요령 및 임의의 입력에 대해서 안정적으로 동작하는가

#### vi. 기타 논의사항