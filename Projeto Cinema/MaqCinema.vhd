ENTITY MaqCinema IS
PORT (reset, clk,comprou, codV, peso, pip, cancel_pip, pip_vendida, serv, cancel_serv, serv_completo, fim_filme : IN BIT;
			Write_Code ,Clear_Code , Cpip, Cser, LibSala, LibCadeira : OUT BIT);
END;


ARCHITECTURE behavior OF MaqCinema IS

TYPE estado IS (Init, Espera_compra, Compra_ingresso, Espera_entrada, Libera_Entrada, Espera_cadeira, Destrava_cadeira,  Assiste_filme, Chama_Servico, Chama_pipoca);
SIGNAL estado_atual : estado;

BEGIN

PROCESS(codV, peso, pip, cancel_pip, pip_vendida, serv, cancel_serv, serv_completo, fim_filme)
BEGIN
	IF(reset = '1') THEN
	estado_atual <= Init; --Estado inicial
	ELSIF(clk'EVENT and clk='1') THEN
	
	CASE estado_atual IS
		WHEN Init => estado_atual <= Espera_compra;
		
		WHEN Espera_compra => 
			IF (comprou = '0') THEN
				estado_atual <= Espera_compra;
			ELSE
				estado_atual <= Compra_ingresso;
			END IF;
		
		WHEN Compra_ingresso => estado_atual <= Espera_entrada;
		
		WHEN Espera_entrada =>
			IF(CodV='0') THEN
				estado_atual <= Espera_entrada;
			ELSE
				estado_atual <= Libera_Entrada;
			END IF;
			
		WHEN Libera_Entrada => estado_atual <= Espera_cadeira;
		
		WHEN Espera_cadeira =>
			IF(codV='0') THEN
				estado_atual <= Espera_cadeira;
			ELSE
				estado_atual <= Destrava_cadeira;
			END IF;
		
		WHEN Destrava_cadeira => 
			IF (peso = '0') THEN
				estado_atual <= Destrava_cadeira;
			ELSE
				estado_atual <= Assiste_filme;
			END IF;
		
		WHEN Assiste_filme => 
			IF(pip = '0' AND serv = '0' AND peso = '1') THEN
				estado_atual <= Assiste_filme;
			ELSIF (serv = '1') THEN
				estado_atual <= Chama_Servico;
			ELSIF (pip = '1') THEN
				estado_atual <= Chama_pipoca;
			ELSIF (peso = '0' AND fim_filme = '0') THEN
				estado_atual <= Espera_Entrada;
			ELSIF (peso='0' AND fim_filme = '1') THEN
				estado_atual <= Init;
			END IF;
		
		WHEN Chama_Servico =>
			IF(serv_completo = '0' AND cancel_serv = '0') THEN
				estado_atual <= Chama_Servico;
			ELSIF(serv_completo='1' OR cancel_serv ='1') THEN
				estado_atual <= Assiste_filme;
			END IF;
		
		WHEN Chama_pipoca => 
			IF(pip_vendida = '0' AND cancel_pip = '0') THEN
				estado_atual <= Chama_pipoca;
			ELSIF(pip_vendida = '1' OR cancel_pip = '1') THEN
				estado_atual <= Assiste_filme;
			END IF;
		
			
		WHEN others => estado_atual <= Init;
		
	END CASE;
	
	
	END IF;


END PROCESS;

WITH estado_atual SELECT
	Write_Code <= '1' WHEN Compra_ingresso,
							'0' WHEN others;

WITH estado_atual SELECT
	Clear_Code <= '1' WHEN Init,
						'0'WHEN others;
			
WITH estado_atual SELECT
	Cpip <= '1' WHEN Chama_pipoca,
				'0' WHEN Assiste_filme,
				'0' WHEN others;

WITH estado_atual SELECT
	Cser <= '1' WHEN Chama_Servico,
				'0'WHEN Assiste_filme,
				'0' WHEN others;
	
WITH estado_atual SELECT
	LibSala <= '0'WHEN Init,
					'1' WHEN Libera_Entrada,
					'0' WHEN others;

WITH estado_atual SELECT
	LibCadeira <= '1'WHEN Destrava_cadeira,
						'0' WHEN others;

					

END;