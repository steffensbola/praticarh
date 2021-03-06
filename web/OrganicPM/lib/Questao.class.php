<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class Questao extends Transactions
	{
		private $teste;
		private $tipoQuestao;
		
		private $codigo;
		private $descricao;
	
		/**
		 * @return the $teste
		 */
		public function getTeste() {
			return $this->teste;
		}
	
			/**
		 * @return the $tipoQuestao
		 */
		public function getTipoQuestao() {
			return $this->tipoQuestao;
		}
	
			/**
		 * @return the $codigo
		 */
		public function getCodigo() {
			return $this->codigo;
		}
	
			/**
		 * @return the $descricao
		 */
		public function getDescricao() {
			return $this->descricao;
		}
	
			/**
		 * @param $teste the $teste to set
		 */
		public function setTeste($teste) {
			$this->teste = $teste;
		}
	
			/**
		 * @param $tipoQuestao the $tipoQuestao to set
		 */
		public function setTipoQuestao($tipoQuestao) {
			$this->tipoQuestao = $tipoQuestao;
		}
	
			/**
		 * @param $codigo the $codigo to set
		 */
		public function setCodigo($codigo) {
			$this->codigo = $codigo;
		}
	
			/**
		 * @param $descricao the $descricao to set
		 */
		public function setDescricao($descricao) {
			$this->descricao = $descricao;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_QUESTOES}()
								->teste_cod()
								->descricao()
								->tip_que_cod()
							->number($this->teste->getCodigo())
							->string($this->descricao)
							->number($this->tipoQuestao->getCodigo());
							
				$result = $this->run();
																
				if ($result !== false)
					{
						$this->getInsertedCodigo();
						return $result;
					}
				else
					return false;
			}
			
		public function deleteByTeste()
			{
				$this
					->delete()
					->from()
						->{TBL_QUESTOES}()
					->where()
						->teste_cod()->equ()->number($this->teste->getCodigo());
					 
				return $this->run();
			}  
			
		public function alter()
			{
				$this
					->update()
						->{TBL_QUESTOES}()
					->set()
						->descricao()->equ()->string($this->descricao)
						->tip_que_cod()->equ()->number($this->tipoQuestao->getCodigo())
					->where()
						->questao_cod()->equ()->number($this->codigo);
						
				$result = $this->run();
												
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function searchByCodigo()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_QUESTOES}()
					->where()
						->questao_cod()->equ()->number($this->codigo);
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return true;
				else
					return false;	
			}
			
		public function getInsertedCodigo()
			{
				$seq = "questao_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->codigo = $this->db->fetchField("CURRVAL");
			}
			
		public function getDataByCodigo()
			{
				$this
					->select()
						->descricao()
						->tip_que_cod()
					->from()
						->{TBL_QUESTOES}()
					->where()
						->questao_cod()->equ()->number($this->codigo);
						
				$this->run();
									
				$data = $this->db->fetchRow();
				
				if ($data === false)
					return false;
				else
					return $data;
			}
			
		public function listQuestoesByCodigo()
			{
				$this
					->select()
						->q()->questao_cod()
						->q()->descricao()
						->t()->tipo()
						->q()->tip_que_cod()
					->from()
						->{TBL_QUESTOES}("q")
						->{TBL_TIPOS_QUESTOES}("t")
					->where()
						->q()->teste_cod()->equ()->number($this->teste->getCodigo())
					->and()
						->q()->tip_que_cod()->equ()->t()->tip_que_cod();
						
				$this->run();
																
				$list = $this->db->fetchAll();
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
			
		public function listQuestoesByTeste($min, $max)
			{
				$this
					->select()
						->from()
							->{"(SELECT q.questao_cod, q.descricao, t.tipo, row_number() OVER (ORDER BY q.questao_cod) rn ".
							"FROM ".TBL_QUESTOES." q, ".TBL_TIPOS_QUESTOES." t".
							" WHERE q.tip_que_cod = t.tip_que_cod".
							" AND q.teste_cod = ".$this->teste->getCodigo().")"}()
						->where()
							->rn()->gtr()->number($min)
						->and()
							->rn()->leq()->number($max)
						->orderBy()
							->rn();
						
				$this->run();
																				
				$list = $this->db->fetchAll("num");
				
				if ($list !== false)
					return $list;
				else
					return false;
			}
			
		public function countByTeste()
			{
				$this
					->select()
						->count()->as()->total()
					->from()
						->{TBL_QUESTOES}()
					->where()
						->teste_cod()->equ()->number($this->teste->getCodigo());
						
				$this->run();
																
				$total = $this->db->fetchField("TOTAL");
				
				if ($total !== false)
					return $total;
				else
					return false;
			}
		
	}