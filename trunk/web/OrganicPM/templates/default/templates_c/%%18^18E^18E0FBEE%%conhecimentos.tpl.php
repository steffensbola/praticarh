<?php /* Smarty version 2.6.26, created on 2010-06-07 01:07:39
         compiled from forms%5Ccurriculo_candidato%5Cconhecimentos.tpl */ ?>
					<form id="cand_form" class="appnitro" action="gravarDadosPessoais.php" method="post">
						<h2>Conhecimentos</h2>
						<ul>
							<li id="li_1" >
								<label class="description" for="grupo_conhecimento">Grupo de Conhecimento: </label>
								<div>
									<input id="grupo_conhecimento" name="grupo_conhecimento" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['grupo_conhecimento']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_2" >
								<label class="description" for="conhecimento">Conhecimento: </label>
								<div>
									<input id="conhecimento" name="conhecimento" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['conhecimento']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>

							<li id="li_3" >
								<label class="description" for="proficiencia">ProficiÍncia: </label>
								<div>
									<input id="proficiencia" name="proficiencia" class="element text medium" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['proficiencia']; ?>
"/> 
									<p class="error"></p>
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="<?php echo $this->_tpl_vars['pessoa_cod']; ?>
"/>
							<input name="conhecimento_cod" type="hidden" value="<?php echo $this->_tpl_vars['conhecimento_cod']; ?>
"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>