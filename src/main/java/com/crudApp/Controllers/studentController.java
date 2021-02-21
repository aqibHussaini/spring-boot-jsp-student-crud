package com.crudApp.Controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.crudApp.Entitities.Student;
import com.crudApp.repositories.studentrepo;

@Controller
public class studentController {
	@Autowired	
	studentrepo studentrepo;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:/page/0";
	}
	@RequestMapping(value = "/page/{page}", method = RequestMethod.GET)
	public String home(Model m,@PathVariable("page")int page) {
		Pageable pageable=PageRequest.of(page, 4);
		Page<Student> stds=this.studentrepo.findAll(pageable);
		List<Student> list=stds.toList();
		m.addAttribute("list", list);
		m.addAttribute("stds", stds);
		return "home";
	}
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(Model m,@RequestParam("ID")int id) {
		Optional<Student>  optional=null;
		if(id>0)
		{
			optional=this.studentrepo.findById(id);
		}
		List<Student> list=new ArrayList<Student>();
		list.add(optional.get());
		Page<Student> stds=null;
		m.addAttribute("list", list);
		m.addAttribute("stds", stds);
		return "home";
	}
	@RequestMapping(value = "/formHandler", method = RequestMethod.POST)
	public String saveStudent(Student student,Model m) {
			this.studentrepo.saveStudent(student.getS_age(),student.getS_class(),student.getS_email(),student.getS_favourite_subject(),student.getS_gender(),student.getS_name());		
		return "redirect:/page/0";
	}
	@RequestMapping("/delete/{id}")
	public String deleteStudent(@PathVariable("id") int id)
	{
		this.studentrepo.deleteStudent(id);
		return "redirect:/page/0";
	}
	@RequestMapping("/update/{id}")
	public String updateStudentForm(@PathVariable("id") int id,HttpServletRequest req)
	{
		Student student=this.studentrepo.getStudentById(id);
		req.getSession().setAttribute("student", student);
		return "updateStudent";
	}
	@RequestMapping("/updateStudent")
	public String updateStudent(Student student)
	{
		try
		{
			this.studentrepo.save(student);
		}
		catch (Exception e) {
		}
		return "redirect:/page/0";
	}
}
