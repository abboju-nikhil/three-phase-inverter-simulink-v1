%% =========================================================
%  3-PHASE INVERTER ANALYSIS (FINAL VERSION)
% ==========================================================

%% ===== TIME =====
t = out.tout;

lw1 = 2;      % PWM thickness
lw2 = 2.5;    % MOSFET / voltage thickness


%% ===== MOSFET DATA =====
Q1 = out.Q1OP.MOSFET_voltage.data;
Q2 = out.Q2OP.MOSFET_voltage.data;
Q3 = out.Q3OP.MOSFET_voltage.data;
Q4 = out.Q4OP.MOSFET_voltage.data;
Q5 = out.Q5OP.MOSFET_voltage.data;
Q6 = out.Q6OP.MOSFET_voltage.data;


%% ===== CURRENT DATA =====
Ia = out.ia.data;
Ib = out.ib.data;
Ic = out.ic.data;


%% ===== PHASE VOLTAGES =====
Va = out.opvoltage.signals.values(:,1);
Vb = out.opvoltage.signals.values(:,2);
Vc = out.opvoltage.signals.values(:,3);


%% =========================================================
%% FIGURE 1 : PHASE A
%% =========================================================
figure(1);

subplot(2,1,1);
plot(t, out.PHAPGOP.signals.values, 'b', 'LineWidth', lw1); hold on;
plot(t, Q1, 'r', 'LineWidth', lw2);
grid on;
title('Phase A: PWM vs Upper MOSFET (Q1)');
xlabel('Time (s)');
ylabel('Amplitude / Voltage');
legend('PWM A','Q1');

subplot(2,1,2);
plot(t, out.PHAPGNOP.signals.values, 'm', 'LineWidth', lw1); hold on;
plot(t, Q2, 'g', 'LineWidth', lw2);
grid on;
title('Phase A: NOT PWM vs Lower MOSFET (Q2)');
xlabel('Time (s)');
ylabel('Amplitude / Voltage');
legend('NOT PWM A','Q2');


%% =========================================================
%% FIGURE 2 : PHASE B
%% =========================================================
figure(2);

subplot(2,1,1);
plot(t, out.PHBPGOP.signals.values, 'b', 'LineWidth', lw1); hold on;
plot(t, Q3, 'r', 'LineWidth', lw2);
grid on;
title('Phase B: PWM vs Upper MOSFET (Q3)');
xlabel('Time (s)');
ylabel('Amplitude / Voltage');
legend('PWM B','Q3');

subplot(2,1,2);
plot(t, out.PHBPGNOP.signals.values, 'm', 'LineWidth', lw1); hold on;
plot(t, Q4, 'g', 'LineWidth', lw2);
grid on;
title('Phase B: NOT PWM vs Lower MOSFET (Q4)');
xlabel('Time (s)');
ylabel('Amplitude / Voltage');
legend('NOT PWM B','Q4');


%% =========================================================
%% FIGURE 3 : PHASE C
%% =========================================================
figure(3);

subplot(2,1,1);
plot(t, out.PHCPGOP.signals.values, 'b', 'LineWidth', lw1); hold on;
plot(t, Q5, 'r', 'LineWidth', lw2);
grid on;
title('Phase C: PWM vs Upper MOSFET (Q5)');
xlabel('Time (s)');
ylabel('Amplitude / Voltage');
legend('PWM C','Q5');

subplot(2,1,2);
plot(t, out.PHCPGNOP.signals.values, 'm', 'LineWidth', lw1); hold on;
plot(t, Q6, 'g', 'LineWidth', lw2);
grid on;
title('Phase C: NOT PWM vs Lower MOSFET (Q6)');
xlabel('Time (s)');
ylabel('Amplitude / Voltage');
legend('NOT PWM C','Q6');


%% =========================================================
%% FIGURE 4 : VOLTAGE & CURRENT (SEPARATE SUBPLOTS)
%% =========================================================
figure(4);

%% --- Subplot 1: Voltages ---
subplot(2,1,1);
plot(t, Va, 'r', 'LineWidth', lw2); hold on;
plot(t, Vb, 'g', 'LineWidth', lw2);
plot(t, Vc, 'b', 'LineWidth', lw2);
grid on;
title('Three-Phase Output Voltages (Va, Vb, Vc)');
xlabel('Time (s)');
ylabel('Voltage (V)');
legend('Va','Vb','Vc');

%% --- Subplot 2: Currents ---
subplot(2,1,2);
plot(t, Ia, 'r', 'LineWidth', lw1); hold on;
plot(t, Ib, 'g', 'LineWidth', lw1);
plot(t, Ic, 'b', 'LineWidth', lw1);
grid on;
title('Three-Phase Output Currents (Ia, Ib, Ic)');
xlabel('Time (s)');
ylabel('Current (A)');
legend('Ia','Ib','Ic');


%% =========================================================
%% FIGURE 5 : LINE VOLTAGES
%% =========================================================
figure(5);

Vab = Va - Vb;
Vbc = Vb - Vc;
Vca = Vc - Va;

plot(t, Vab, 'Color',[1 0.5 0], 'LineWidth', lw2); hold on;
plot(t, Vbc, 'm', 'LineWidth', lw2);
plot(t, Vca, 'k', 'LineWidth', lw2);
grid on;
title('Line Voltages (Vab, Vbc, Vca)');
xlabel('Time (s)');
ylabel('Voltage (V)');
legend('Vab','Vbc','Vca');


%% =========================================================
%% FIGURE 6 : MOSFET SWITCHING
%% =========================================================
figure(6);

subplot(2,1,1);
plot(t, Q1, 'r', 'LineWidth', lw2); hold on;
plot(t, Q3, 'g', 'LineWidth', lw2);
plot(t, Q5, 'b', 'LineWidth', lw2);
grid on;
title('Upper MOSFET Switching (Q1, Q3, Q5)');
xlabel('Time (s)');
ylabel('Voltage (V)');
legend('Q1','Q3','Q5');

subplot(2,1,2);
plot(t, Q2, 'r', 'LineWidth', lw2); hold on;
plot(t, Q4, 'g', 'LineWidth', lw2);
plot(t, Q6, 'b', 'LineWidth', lw2);
grid on;
title('Lower MOSFET Switching (Q2, Q4, Q6)');
xlabel('Time (s)');
ylabel('Voltage (V)');
legend('Q2','Q4','Q6');


%% =========================================================
%% FIGURE 7 : PWM SIGNALS
%% =========================================================
figure(7);

subplot(2,1,1);
plot(t, out.PHAPGOP.signals.values, 'r', 'LineWidth', lw1); hold on;
plot(t, out.PHBPGOP.signals.values, 'g', 'LineWidth', lw1);
plot(t, out.PHCPGOP.signals.values, 'b', 'LineWidth', lw1);
grid on;
title('PWM Signals (Upper Switch Control)');
xlabel('Time (s)');
ylabel('Amplitude');
legend('PWM A','PWM B','PWM C');

subplot(2,1,2);
plot(t, out.PHAPGNOP.signals.values, 'r', 'LineWidth', lw1); hold on;
plot(t, out.PHBPGNOP.signals.values, 'g', 'LineWidth', lw1);
plot(t, out.PHCPGNOP.signals.values, 'b', 'LineWidth', lw1);
grid on;
title('Complementary NOT PWM Signals (Lower Switch Control)');
xlabel('Time (s)');
ylabel('Amplitude');
legend('NOT PWM A','NOT PWM B','NOT PWM C');