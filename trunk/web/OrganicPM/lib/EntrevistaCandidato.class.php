<?php

include_once ROOT.'lib/Database/Transactions.class.php';

class EntrevistaCandidato extends Transactions
	{
		private $pessoa;
		private $processoSeletivo;
		private $fase;
		
		private $dataEfetiva;
		private $dataAgendada;
		private $comentario;
		private $entrevistador;
		private $status;
	
		/**
		 * @return the $dataEfetiva
		 */
		public function getDataEfetiva() {
			return $this->dataEfetiva;
		}
	
			/**
		 * @return the $dataAgendada
		 */
		public function getDataAgendada() {
			return $this->dataAgendada;
		}
	
			/**
		 * @param $dataEfetiva the $dataEfetiva to set
		 */
		public function setDataEfetiva($dataEfetiva) {
			$this->dataEfetiva = $dataEfetiva;
		}
	
			/**
		 * @param $dataAgendada the $dataAgendada to set
		 */
		public function setDataAgendada($dataAgendada) {
			$this->dataAgendada = $dataAgendada;
		}
	
		/**
		 * @return the $pessoa
		 */
		public function getPessoa() {
			return $this->pessoa;
		}
	
			/**
		 * @return the $processoSeletivo
		 */
		public function getProcessoSeletivo() {
			return $this->processoSeletivo;
		}
	
			/**
		 * @return the $fase
		 */
		public function getFase() {
			return $this->fase;
		}
	
			/**
		 * @return the $comentario
		 */
		public function getComentario() {
			return $this->comentario;
		}
	
			/**
		 * @return the $entrevistador
		 */
		public function getEntrevistador() {
			return $this->entrevistador;
		}
	
			/**
		 * @return the $status
		 */
		public function getStatus() {
			return $this->status;
		}
	
			/**
		 * @param $pessoa the $pessoa to set
		 */
		public function setPessoa($pessoa) {
			$this->pessoa = $pessoa;
		}
	
			/**
		 * @param $processoSeletivo the $processoSeletivo to set
		 */
		public function setProcessoSeletivo($processoSeletivo) {
			$this->processoSeletivo = $processoSeletivo;
		}
	
			/**
		 * @param $fase the $fase to set
		 */
		public function setFase($fase) {
			$this->fase = $fase;
		}
	
			/**
		 * @param $comentario the $comentario to set
		 */
		public function setComentario($comentario) {
			$this->comentario = $comentario;
		}
	
			/**
		 * @param $entrevistador the $entrevistador to set
		 */
		public function setEntrevistador($entrevistador) {
			$this->entrevistador = $entrevistador;
		}
	
			/**
		 * @param $status the $status to set
		 */
		public function setStatus($status) {
			$this->status = $status;
		}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_ENTREVISTAS_CANDIDATOS}()
								->pessoa_cod()
								->pro_sel_cod()
								->fase_cod()
								->data()
								->comentario()
								->entrevistador()
								->status()
							->number($this->pessoa->getCodigo())
							->number($this->processoSeletivo->getCodigo())
							->number($this->fase->getCodigo())
							->string($this->data)
							->string($this->comentario)
							->string($this->entrevistador)
							->string($this->status);
							
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function recordDataAgendada()
			{
				$this
					->update()
						->{TBL_ENTREVISTAS_CANDIDATOS}()
					->set()
						->data_agendada()->equ()->{"TO_DATE('".$this->dataAgendada."', 'YYYY-MM-DD HH24:MI:SS')"}()
						->status()->equ()->string("agendado")
					->where()
						->pessoa_cod()->equ()->number($this->pessoa->getCodigo())
					->and()
						->pro_sel_cod()->equ()->number($this->processoSeletivo->getCodigo())
					->and()
						->fase_cod()->equ()->number($this->fase->getCodigo());
							
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function recordRegistro()
			{
				$this
					->update()
						->{TBL_ENTREVISTAS_CANDIDATOS}()
					->set()
						->data_efetiva()->equ()->{"TO_DATE('".$this->dataEfetiva."', 'YYYY-MM-DD HH24:MI:SS')"}()
						->entrevistador()->equ()->string($this->entrevistador)
						->comentario()->equ()->string($this->comentario)
						->status()->equ()->string($this->status)
					->where()
						->pessoa_cod()->equ()->number($this->pessoa->getCodigo())
					->and()
						->pro_sel_cod()->equ()->number($this->processoSeletivo->getCodigo())
					->and()
						->fase_cod()->equ()->number($this->fase->getCodigo());
							
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
			
		public function countParaAgendar()
			{
				$this
					->select()
						->count()->as()->num()
					->from()
						->{TBL_ENTREVISTAS_CANDIDATOS}()
					->where()
						->status()->equ()->string("agendar");
						
				$this->run();
				
				$num = $this->db->fetchField("NUM");
								
				if ($num !== false && $num > 0)
					return $num;
				else
					return false;
			}
			
		public function getDataByCodigo()
			{
				$this
					->select()
						->p()->nome()
						->ps()->descricao()
						->{"to_char(f.data_inicio, 'DD/MM/YYYY') as data_inicio"}()
						->{"to_char(f.data_fim, 'DD/MM/YYYY') as data_fim"}()
						->e()->data_agendada()
					->from()
						->{TBL_PESSOAS}("p")
						->{TBL_PROCESSOS_SELETIVOS}("ps")
						->{TBL_FASES}("f")
						->{TBL_ENTREVISTAS_CANDIDATOS}("e")
					->where()
						->e()->pessoa_cod()->equ()->p()->pessoa_cod()
					->and()
						->e()->fase_cod()->equ()->f()->fase_cod()
					->and()
						->e()->pro_sel_cod()->equ()->ps()->pro_sel_cod()
					->and()
						->e()->pessoa_cod()->equ()->number($this->pessoa->getCodigo())
					->and()
						->e()->fase_cod()->equ()->number($this->fase->getCodigo())
					->and()
						->e()->pro_sel_cod()->equ()->number($this->processoSeletivo->getCodigo());
						
				$this->run();
									
				$data = $this->db->fetchRow();
				
				if ($data === false)
					return false;
				else
					return $data;
			}
			
		public function listEntrevistasParaAgendarByPage($min, $max)
			{								
				$this
					->select()
						->from()
							->{"(SELECT p.nome, SUBSTR(ps.descricao, 0, 20),".
							" to_char(f.data_inicio, 'DD/MM/YYYY') as data_inicio,".
							" to_char(f.data_fim, 'DD/MM/YYYY') as data_fim, e.pessoa_cod, e.pro_sel_cod, e.fase_cod,".
							" row_number() OVER (ORDER BY e.fase_cod) rn".
							" FROM ".TBL_PESSOAS." p,".TBL_PROCESSOS_SELETIVOS." ps,".TBL_FASES." f,".TBL_ENTREVISTAS_CANDIDATOS." e".
							" WHERE e.pessoa_cod = p.pessoa_cod".
							" AND e.fase_cod = f.fase_cod".
							" AND e.pro_sel_cod = ps.pro_sel_cod AND e.status = 'agendar')"}()
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
			
		public function listEntrevistasParaRegistrarByPage($min, $max)
			{								
				$this
					->select()
						->from()
							->{"(SELECT p.nome, SUBSTR(ps.descricao, 0, 20),".
							" to_char(e.data_agendada, 'DD/MM/YYYY') as data_agendada, e.pessoa_cod, e.pro_sel_cod, e.fase_cod,".
							" row_number() OVER (ORDER BY e.fase_cod) rn".
							" FROM ".TBL_PESSOAS." p,".TBL_PROCESSOS_SELETIVOS." ps,".TBL_FASES." f,".TBL_ENTREVISTAS_CANDIDATOS." e".
							" WHERE e.pessoa_cod = p.pessoa_cod".
							" AND e.fase_cod = f.fase_cod".
							" AND e.pro_sel_cod = ps.pro_sel_cod AND e.status = 'agendado')"}()
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
			
		public function recordAgendamento()
			{
				$this
					->insert()
						->into()
							->{TBL_ENTREVISTAS_CANDIDATOS}()
								->pessoa_cod()
								->pro_sel_cod()
								->fase_cod()
								->status()
							->number($this->pessoa->getCodigo())
							->number($this->processoSeletivo->getCodigo())
							->number($this->fase->getCodigo())
							->string($this->status);
							
				$result = $this->run();
																
				if ($result !== false)
					{
						return $result;
					}
				else
					return false;
			}
		
	}