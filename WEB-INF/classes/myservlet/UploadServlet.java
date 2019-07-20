package myservlet;

import myservlet.teacher_bean;
import myservlet.source_bean;
import myservlet.class_bean;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name="UploadServlet",urlPatterns="/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet{

   public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             HttpSession session = request.getSession();
             request.setCharacterEncoding("utf-8");
             //获得老师将要上传的Cou_ID以及老师的ID
             String Cou_ID = request.getParameter("R");
             teacher_bean teacher = (teacher_bean) session.gerAttribute("TeacherBean");
             String Tea_ID = teacher.getTea_ID();


             response.setCharacterEncoding("utf-8");
             response.setContentType("text/html;charset=utf-8");

             String savePath = "/tmp/uploadFile" + File.separator + Tea_ID + File.separator + Cou_ID;

             Collection<Part> parts = request.getParts();

             if (parts.size()==1) {

                 Part part = request.getPart("file");
                 String header = part.getHeader("content-disposition");

                 String fileName = getFileName(header);

                 part.write(savePath + File.separator + fileName);
             }else {

                 for (Part part : parts) {
                     String header = part.getHeader("content-disposition");

                     String fileName = getFileName(header);

                     part.write(savePath + File.separator + fileName);
                 }
             }
             PrintWriter out = response.getWriter();
             out.println("Upload Successfully!");
             out.flush();
             out.close();
     }

      /**
      *
      *
      *
      * @param header
      * @return
      */
     public String getFileName(String header) {

         String[] tempArr1 = header.split(";");
         String[] tempArr2 = tempArr1[2].split("=");
         String fileName = tempArr2[1].substring(tempArr2[1].lastIndexOf("\\")+1).replaceAll("\"", "");
         return fileName;
     }

     public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         this.doGet(request, response);
     }
}
