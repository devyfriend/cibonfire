<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

function test(&$x,$exit=0)
{
	echo "<pre>";
	if(is_array($x) || is_object($x)){
		echo print_r($x);
	}else{
		echo var_dump($x);
	}
	echo "</pre><hr />";
	if($exit==1){ die(); }
}

// check and echoing a string variable
function _s(&$var = null, $echo=false){
	$str = isset($var) && !empty(trim($var)) ? $var : '';
	if(! $echo) return $str;
	echo $str;
}

// check and echoing an object property variable
function _o($obj, $prop, $echo=false){
	$str = is_object($obj) && property_exists($obj,$prop) && !empty(trim($obj->$prop)) ? $obj->$prop : '';
	if(! $echo) return $str;
	echo $str;
}

function keyval($arr, $keyname = 'id', $valname = 'name', $switch = false)
{
	$new_arr = false;
	if(is_array($arr) && count($arr))
	{
		foreach ($arr as $key => $value) {
			if(isset($value->$keyname))
			{
				if(! $switch)
				{
					$new_arr[$value->$keyname] = $value->$valname;
				}else{
					$new_arr[$value->$valname] = $value->$keyname;
				}
			}else{
				if(! $switch)
				{
					$new_arr[$value[$keyname]] = isset($value[$valname]) ? $value[$valname] : false;
				}else{
					$new_arr[$value[$valname]] = isset($value[$keyname]) ? $value[$keyname] : false;
				}
			}
		}
	}
	return $new_arr;
}

function is_for($recs){
	return (bool) (is_array($recs) && count($recs));
}


function phpdbnow($show_time = true)
{
	return date('Y-m-d H:i:s', time());
}

function jsout($success = 0, $param = array())
{
	$param['success'] = $success;
	header('Content-type: application/json');
	exit( json_encode( $param ) );
}

function buildDayDropdown($name = '', $value = '', $extra) {
    for ($day = 0; $day <= 31; $day++) {
        $days[] = $day;
    }
    unset($days[0]);
    return ci_form_dropdown($name, $days, $value, $extra);
}

function buildYearDropdown($name = '', $value = '', $extra) {
    $years = range(2005, date("Y"));
    foreach ($years as $year) {
        $year_list[$year] = $year;
    }
    return ci_form_dropdown($name, $year_list, $value, $extra);
}

function buildMonthDropdown($name = '', $value = '', $extra) {
    $month = array(
        '01' => 'January',
        '02' => 'February',
        '03' => 'March',
        '04' => 'April',
        '05' => 'May',
        '06' => 'June',
        '07' => 'July',
        '08' => 'August',
        '09' => 'September',
        '10' => 'October',
        '11' => 'November',
        '12' => 'December');
    return ci_form_dropdown($name, $month, $value, $extra);
}

if ( ! function_exists('ci_form_dropdown'))
{
	function ci_form_dropdown($name = '', $options = array(), $selected = array(), $extra = '')
	{
		if ( ! is_array($selected))
		{
			$selected = array($selected);
		}

		// If no selected state was submitted we will attempt to set it automatically
		if (count($selected) === 0)
		{
			// If the form name appears in the $_POST array we have a winner!
			if (isset($_POST[$name]))
			{
				$selected = array($_POST[$name]);
			}
		}

		if ($extra != '') $extra = ' '.$extra;

		$multiple = (count($selected) > 1 && strpos($extra, 'multiple') === FALSE) ? ' multiple="multiple"' : '';

		$form = '<select name="'.$name.'"'.$extra.$multiple.">\n";

		foreach ($options as $key => $val)
		{
			$key = (string) $key;

			if (is_array($val) && ! empty($val))
			{
				$form .= '<optgroup label="'.$key.'">'."\n";

				foreach ($val as $optgroup_key => $optgroup_val)
				{
					$sel = (in_array($optgroup_key, $selected)) ? ' selected="selected"' : '';

					$form .= '<option value="'.$optgroup_key.'"'.$sel.'>'.(string) $optgroup_val."</option>\n";
				}

				$form .= '</optgroup>'."\n";
			}
			else
			{
				$sel = (in_array($key, $selected)) ? ' selected="selected"' : '';

				$form .= '<option value="'.$key.'"'.$sel.'>'.(string) $val."</option>\n";
			}
		}

		$form .= '</select>';

		return $form;
	}
}

if ( ! function_exists('button'))
{
	function button($uri = '', $title = '', $attributes = '')
	{
		$title = (string) $title;

		if ( ! is_array($uri))
		{
			$site_url = ( ! preg_match('!^\w+://! i', $uri)) ? site_url($uri) : $uri;
		}
		else
		{
			$site_url = site_url($uri);
		}

		if ($title == '')
		{
			$title = $site_url;
		}

		if ($attributes != '')
		{
			$attributes = _parse_attributes($attributes);
		}

		return '<button href="'.$site_url.'"'.$attributes.'>'.$title.'</button>';
	}
}
