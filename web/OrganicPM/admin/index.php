<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';

include_once '../lib/ProcessoSeletivo.class.php';
include_once '../lib/EntrevistaCandidato.class.php';

global $form, $session;

//==================================================================
// Template ========================================================
//==================================================================

$smarty = new Smarty;

//Smarty Configs
$smarty->template_dir	= ROOT.'templates/'.DEFAULT_TEMPLATE.'/templates';
$smarty->compile_dir	= ROOT.'templates/'.DEFAULT_TEMPLATE.'/templates_c';
$smarty->cache_dir		= ROOT.'templates/'.DEFAULT_TEMPLATE.'/cache';
$smarty->config_dir		= ROOT.'templates/'.DEFAULT_TEMPLATE.'/configs';
$smarty->compile_check	= true;
$smarty->debugging		= true;

//Variables
$smarty->assign("title", "OrganicPM");
$smarty->assign("subtitle", "People Management System");
$smarty->assign("page", "admin");
$smarty->assign("logado", $session->loggedIn);
$smarty->assign("isAdmin", $session->isAdmin());

if ($session->loggedIn)
	{
		$procSel = new ProcessoSeletivo();
		$data = $procSel->listProcSelAndInscritosByPage(0, 3);
		$smarty->assign("procSel", $data);
		
		$entrevCand = new EntrevistaCandidato();
		$data = $entrevCand->listEntrevistasParaAgendarByPage(0, 3);
		$smarty->assign("entrevAgendar", $data);
		
		$entrevCand = new EntrevistaCandidato();
		$data = $entrevCand->listEntrevistasParaRegistrarByPage(0, 3);
		$smarty->assign("entrevRegistrar", $data);		
	}

//Show the page
$smarty->display('admin\index.tpl');