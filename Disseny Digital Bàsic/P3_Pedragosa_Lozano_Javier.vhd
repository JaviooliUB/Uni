ENTITY D_FF IS
PORT(d,clk,pre,clr: IN BIT; q, no_q: OUT BIT);
END D_FF;

ARCHITECTURE ifthen OF D_FF IS

	SIGNAL qint: BIT;

	BEGIN
	PROCESS(d,clk,pre,clr)

	BEGIN
		IF clr='0' THEN qint<='0' AFTER 2 ns;
		ELSIF pre ='0' THEN qint<='1' AFTER 2 ns;
		ELSIF clk'EVENT AND clk='1' THEN qint <= d  AFTER 2 ns;
		END IF;
	END PROCESS;

	q<=qint; no_q<=NOT qint;

END ifthen;


ENTITY D_Latch IS
PORT(d,clk,pre,clr: IN BIT; q, no_q: OUT BIT);
END D_Latch;

ARCHITECTURE ifthen OF D_Latch IS

	SIGNAL qint: BIT;

	BEGIN
	PROCESS(d,clk,pre,clr)

	BEGIN
		IF clr='0' THEN qint<='0' AFTER 2 ns;
		ELSIF pre ='0' THEN qint<='1' AFTER 2 ns;
		ELSIF clk='1' THEN qint <= d  AFTER 2 ns;
		END IF;
	END PROCESS;

	q<=qint; no_q<=NOT qint;

END ifthen;


ENTITY JK_FF IS
PORT(j,k,clk,pre,clr: IN BIT; q,no_q: OUT BIT);
END JK_FF;

ARCHITECTURE ifthen OF JK_FF IS

	SIGNAL qint: BIT;

	BEGIN
	PROCESS (j,k,clk,pre,clr,qint)

	BEGIN
		IF clr='0' THEN qint<='0' AFTER 2 ns;
		ELSIF pre='0' THEN qint<='1' AFTER 2 ns;
		ELSIF clk'EVENT AND clk='1' THEN
			IF j='0' AND k='0' THEN qint<=qint AFTER 2 ns;
			ELSIF j='0' AND k='1' THEN qint<='0' AFTER 2 ns;
			ELSIF j='1' AND k='0' THEN qint<='1' AFTER 2 ns;
			ELSIF j='1' AND k='1' THEN qint<= NOT qint AFTER 2 ns;
			END IF;
		END IF;
	END PROCESS;

	q<=qint; no_q<=NOT qint;

END ifthen;


ENTITY JK_Latch IS
PORT(j,k,clk,pre,clr: IN BIT; q,no_q: OUT BIT);
END JK_Latch;

ARCHITECTURE ifthen OF JK_Latch IS

	SIGNAL qint: BIT;

	BEGIN
	PROCESS (j,k,clk,pre,clr,qint)

	BEGIN
		IF clr='0' THEN qint<='0' AFTER 2 ns;
		ELSIF pre='0' THEN qint<='1' AFTER 2 ns;
		ELSIF clk='1' THEN
			IF j='0' AND k='0' THEN qint<=qint AFTER 2 ns;
			ELSIF j='0' AND k='1' THEN qint<='0' AFTER 2 ns;
			ELSIF j='1' AND k='0' THEN qint<='1' AFTER 2 ns;
			ELSIF j='1' AND k='1' THEN qint<= NOT qint AFTER 2 ns;
			END IF;
		END IF;
	END PROCESS;

	q<=qint; no_q<=NOT qint;

END ifthen;


ENTITY T_FF IS
PORT(t,clk,pre,clr: IN BIT; q, no_q: OUT BIT);
END T_FF;

ARCHITECTURE ifthen OF T_FF IS

	SIGNAL qint: BIT;

	BEGIN
	PROCESS(t,clk,pre,clr)

	BEGIN
		IF clr='0' THEN qint<='0' AFTER 2 ns;
		ELSIF pre ='0' THEN qint<='1' AFTER 2 ns;
		ELSIF clk'EVENT AND clk='1' AND t'EVENT AND t='1' THEN qint <= NOT qint  AFTER 2 ns;
		END IF;
	END PROCESS;

	q<=qint; no_q<=NOT qint;

END ifthen;


ENTITY T_Latch IS
PORT(t,clk,pre,clr: IN BIT; q, no_q: OUT BIT);
END T_Latch;

ARCHITECTURE ifthen OF T_Latch IS

	SIGNAL qint: BIT;

	BEGIN
	PROCESS(t,clk,pre,clr)

	BEGIN
		IF clr='0' THEN qint<='0' AFTER 2 ns;
		ELSIF pre ='0' THEN qint<='1' AFTER 2 ns;
		ELSIF clk='1' AND t'EVENT AND t='1' THEN qint <= NOT qint AFTER 2 ns;
		END IF;
	END PROCESS;

	q<=qint; no_q<=NOT qint;

END ifthen;




ENTITY bdp_biestables IS
END bdp_biestables;

ARCHITECTURE test_biestables OF bdp_biestables IS

	COMPONENT d_ff IS
		PORT (d, clk, pre, clr: IN BIT; q, no_q: OUT BIT);
	END COMPONENT;

	COMPONENT d_latch IS
		PORT (d, clk, pre, clr: IN BIT; q, no_q: OUT BIT);
	END COMPONENT;

	COMPONENT jk_ff IS
		PORT (j, k, clk, pre, clr: IN BIT; q, no_q: OUT BIT);
	END COMPONENT;

	COMPONENT jk_latch IS
		PORT (j, k, clk, pre, clr: IN BIT; q, no_q: OUT BIT);
	END COMPONENT;

	COMPONENT t_ff IS
		PORT (t, clk, pre, clr: IN BIT; q, no_q: OUT BIT);
	END COMPONENT;

	COMPONENT t_latch IS
		PORT (t, clk, pre, clr: IN BIT; q, no_q: OUT BIT);
	END COMPONENT;

	SIGNAL ent1, ent2, clock, preset, clear, dff_q, dff_noq, dlatch_q, dlatch_noq,
	jkff_q, jkff_noq, jklatch_q, jklatch_noq, tff_q, tff_noq, tlatch_q, tlatch_noq: BIT;

	FOR DUT1: d_ff USE ENTITY WORK.D_FF(ifthen);
	FOR DUT2: d_latch USE ENTITY WORK.D_Latch(ifthen);
	FOR DUT3: jk_ff USE ENTITY WORK.JK_FF(ifthen);
	FOR DUT4: jk_latch USE ENTITY WORK.JK_Latch(ifthen);
	FOR DUT5: t_ff USE ENTITY WORK.T_FF(ifthen);
	FOR DUT6: t_latch USE ENTITY WORK.T_Latch(ifthen);

	BEGIN
		DUT1: d_ff PORT MAP (ent1, clock, preset, clear, dff_q, dff_noq);
		DUT2: d_latch PORT MAP (ent1, clock, preset, clear, dlatch_q, dlatch_noq);
		DUT3: jk_ff PORT MAP (ent1, ent2, clock, preset, clear, jkff_q, jkff_noq);
		DUT4: jk_latch PORT MAP (ent1, ent2, clock, preset, clear, jklatch_q, jklatch_noq);
		DUT5: t_ff PORT MAP (ent1, clock, preset, clear, tff_q, tff_noq);
		DUT6: t_latch PORT MAP (ent1, clock, preset, clear, tlatch_q, tlatch_noq);

		ent1 <= NOT ent1 AFTER 800 ns;
		ent2 <= NOT ent2 AFTER 400 ns;
		clock <= NOT clock AFTER 500 ns;
		preset <= '0', '1' AFTER 600 ns;
		clear <= '1','0' AFTER 200 ns, '1' AFTER 400 ns;

END test_biestables;

--3. Veus algun comportament estrany? On?
-- En l'instant en qu� totes les entrades (ent1, ent2, clock, preset i clear) tenen valor 1, podem observar com el JK Latch deixa de ser estable.

--4. Quina diferencia hi ha entre un Latch i un FF? (ja sigui del tipus D, JK o T):
-- La principal diferencia es l'us del rellotge. Un Latch nomes modificara la sortida mentre el rellotge estigui en 1 (en cas d'actuar per nivell alt).
-- En canvi, un Flip-Flop nomes modificara la sortida quan el rellotge canvii de 0 a 1 (en cas d'actuar per flanc de pujada).
-- Aixi doncs, el Latch pot modificar la sortida tantes vegades com vulguem durant tot l'interval de temps que duri el pols de rellotge, mentre que
-- el Flip-Flop nomes actualitzara la sortida una vegada per pols.