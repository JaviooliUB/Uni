ENTITY bdp_proves IS
END bdp_proves;

ARCHITECTURE test OF bdp_proves IS
-- Aqu� definim els components el comportament dels quals volem comprovar.
-- Tot i que encara no hem relacionat amb l?entitat que utilitzarem, 
-- el component ha de tenir EXACTAMENT els mateixos noms dels senyals d?entrada i 
-- sortida que l?entitat a la que lligarem.
COMPONENT la_porta_inversor
PORT (a: IN BIT; z: OUT BIT);
END COMPONENT;
COMPONENT la_porta_and2
PORT (a,b: IN BIT; z: OUT BIT);
END COMPONENT;
COMPONENT la_porta_and3
PORT (a,b,c: IN BIT; z: OUT BIT);
END COMPONENT;
COMPONENT la_porta_and4
PORT (a,b,c,d: IN BIT; z: OUT BIT);
END COMPONENT;
COMPONENT la_porta_or2
PORT (a,b: IN BIT; z: OUT BIT);
END COMPONENT;
COMPONENT la_porta_or3
PORT (a,b,c: IN BIT; z: OUT BIT);
END COMPONENT;
COMPONENT la_porta_or4
PORT (a,b,c,d: IN BIT; z: OUT BIT);
END COMPONENT;
-- Declarem els senyals externs que hi han i de quin tipus s�n. Recordeu que
-- encara no es determina quins ser�n d?entrada i quins de sortida. 
SIGNAL ent1, ent2, ent3, ent4, sort_inversor_logica, sort_and2_logica, sort_and3_logica, sort_and4_logica, sort_or2_logica, sort_or3_logica, sort_or4_logica: BIT; 
-- Relacionem el component que volem testejar amb una entitat i arquitectura
-- que abans ja haurem generat i compilat. Cal que ambdues estiguin en un fitxer .VHD 
-- en el directori de treball, si no estan incorporades al mateix fitxer que estem 
-- generantt. 
FOR DUT1: la_porta_inversor USE ENTITY WORK.inversor(logica);
FOR DUT2: la_porta_and2 USE ENTITY WORK.and2(logica);
FOR DUT3: la_porta_and3 USE ENTITY WORK.and3(logica);
FOR DUT4: la_porta_and4 USE ENTITY WORK.and4(logica);
FOR DUT5: la_porta_or2 USE ENTITY WORK.or2(logica);
FOR DUT6: la_porta_or3 USE ENTITY WORK.or3(logica);
FOR DUT7: la_porta_or4 USE ENTITY WORK.or4(logica);

-- Hem acabat la declaraci� i ara comen�a el cos de l?arquitectura
BEGIN
-- Aqu� establim la relaci� entre els senyals abans definits i els
-- terminals del component a testejar. El programa els relaciona
-- en el mateix ordre que estan a l?entitat: el 1r senyal extern ser� el 1r
-- senyal de l?entitat
DUT1: la_porta_inversor PORT MAP (ent1,sort_inversor_logica);
DUT2: la_porta_and2 PORT MAP (ent1,ent2,sort_and2_logica);
DUT3: la_porta_and3 PORT MAP (ent1,ent2,ent3,sort_and3_logica);
DUT4: la_porta_and4 PORT MAP (ent1,ent2,ent3,ent4,sort_and4_logica);
DUT5: la_porta_or2 PORT MAP (ent1,ent2,sort_or2_logica);
DUT6: la_porta_or3 PORT MAP (ent1,ent2,ent3,sort_or3_logica);
DUT7: la_porta_or4 PORT MAP (ent1,ent2,ent3,ent4,sort_or4_logica);

-- Comen�a l?an�lisi de la variaci� de les variables, que cal especificar
-- expl�citament. Indiquem al PROCESS la variaci� de totes les variables
-- que volem que el programa analitzi, aqu� les d?entrada ent1 i ent2.
PROCESS
BEGIN
ent1 <= '0';
ent2 <= '0';
ent3 <= '0';
ent4 <= '0';
WAIT FOR 50 ns;
ent1 <= '1';
ent2 <= '0';
ent3 <= '0';
ent4 <= '0';
WAIT FOR 50 ns;
ent1 <= '0';
ent2 <= '1';
ent3 <= '0';
ent4 <= '0';
WAIT FOR 50 ns;
ent1 <= '1';
ent2 <= '1';
ent3 <= '0';
ent4 <= '0';
WAIT FOR 50 ns;
ent1 <= '0';
ent2 <= '0';
ent3 <= '1';
ent4 <= '0';
WAIT FOR 50 ns;
ent1 <= '1';
ent2 <= '0';
ent3 <= '1';
ent4 <= '0';
WAIT FOR 50 ns;
ent1 <= '0';
ent2 <= '1';
ent3 <= '1';
ent4 <= '0';
WAIT FOR 50 ns;
ent1 <= '1';
ent2 <= '1';
ent3 <= '1';
ent4 <= '0';
WAIT FOR 50 ns;
ent1 <= '0';
ent2 <= '0';
ent3 <= '0';
ent4 <= '1';
WAIT FOR 50 ns;
ent1 <= '1';
ent2 <= '0';
ent3 <= '0';
ent4 <= '1';
WAIT FOR 50 ns;
ent1 <= '0';
ent2 <= '1';
ent3 <= '0';
ent4 <= '1';
WAIT FOR 50 ns;
ent1 <= '1';
ent2 <= '1';
ent3 <= '0';
ent4 <= '1';
WAIT FOR 50 ns;
ent1 <= '0';
ent2 <= '0';
ent3 <= '1';
ent4 <= '1';
WAIT FOR 50 ns;
ent1 <= '1';
ent2 <= '0';
ent3 <= '1';
ent4 <= '1';
WAIT FOR 50 ns;
ent1 <= '0';
ent2 <= '1';
ent3 <= '1';
ent4 <= '1';
WAIT FOR 50 ns;
ent1 <= '1';
ent2 <= '1';
ent3 <= '1';
ent4 <= '1';
WAIT FOR 50 ns;

END PROCESS;
END test;
