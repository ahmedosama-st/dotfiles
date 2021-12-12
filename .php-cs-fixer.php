<?php
/*
 * This document has been generated with
 * https://mlocati.github.io/php-cs-fixer-configurator/#version:3.0.0|configurator
 * you can change this configuration by importing this file.
 */
$config = new PhpCsFixer\Config();

return $config
	->setRiskyAllowed(true)
	->setRules([
		'@PSR2' => true,
		'align_multiline_comment' => true,
		'indentation_type' => true,
		'array_indentation' => true,
		'array_push' => true,
		'array_syntax' => true,
		'blank_line_after_opening_tag' => true,
		'blank_line_before_statement' => ['statements'=>['break', 'case', 'continue', 'default', 'do', 'exit', 'for', 'foreach', 'if', 'include', 'include_once', 'require', 'require_once', 'return', 'switch', 'throw', 'try', 'yield']],
		'class_attributes_separation' => true,
		'clean_namespace' => true,
		'constant_case' => true,
		'explicit_string_variable' => true,
		'implode_call' => true,
		'include' => true,
		'lambda_not_used_import' => true,
		'linebreak_after_opening_tag' => true,
		'list_syntax' => true,
		'lowercase_cast' => true,
		'lowercase_static_reference' => true,
		'magic_constant_casing' => true,
		'magic_method_casing' => true,
		'mb_str_functions' => true,
		'method_chaining_indentation' => true,
		'multiline_whitespace_before_semicolons' => true,
		'new_with_braces' => true,
		'no_alternative_syntax' => true,
		'no_blank_lines_after_class_opening' => true,
		'no_blank_lines_after_phpdoc' => true,
		'no_extra_blank_lines' => true,
		'no_leading_import_slash' => true,
		'no_leading_namespace_whitespace' => true,
		'no_multiline_whitespace_around_double_arrow' => true,
		'no_php4_constructor' => true,
		'no_singleline_whitespace_before_semicolons' => true,
		'no_trailing_comma_in_list_call' => true,
		'no_trailing_comma_in_singleline_array' => true,
		'no_unset_cast' => true,
		'no_unused_imports' => true,
		'no_useless_else' => true,
		'no_useless_return' => true,
		'no_whitespace_before_comma_in_array' => true,
		'no_whitespace_in_blank_line' => true,
		'ordered_imports' => ['sort_algorithm'=>'length'],
		'php_unit_construct' => true,
		'php_unit_dedicate_assert' => true,
		'php_unit_method_casing' => ['case'=>'snake_case'],
		'return_assignment' => true,
		'single_blank_line_before_namespace' => true,
		'single_import_per_statement' => false,
		'single_line_throw' => true,
		'single_quote' => true,
		'trim_array_spaces' => true,
		'use_arrow_functions' => true,
		'whitespace_after_comma_in_array' => true,
	])
	->setIndent('  ')
	->setFinder(
		PhpCsFixer\Finder::create()
			->exclude('vendor')
			->in(__DIR__)
	);
