	qui forv i = 1/`theN' {
		ivregress 2sls indiv_theta_mean hh_faultdist ///
        ( m_indiv_edu_binary m_edu_fault  = instrument i_d ) ///
        `fault_controls' `other_controls' `mother_controls' ///
        if group != `i' ///
        , cl(village_code)
        noi noi di "`i'/`theN' done!"

    mat a = r(table)
      local lower = a[5,2]
      local upper = a[6,2]

		replace b_alt = _b[m_edu_fault] if group == `i'
		replace b_min = `lower' if group == `i'
		replace b_max = `upper' if group == `i'
	}   