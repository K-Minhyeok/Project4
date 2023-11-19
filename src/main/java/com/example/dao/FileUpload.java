package com.example.dao;

import com.example.bean.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;


public class FileUpload {

    public BoardVO uploadPhoto(javax.servlet.http.HttpServletRequest request){
        String filename ="";
        int sizeLimit = 15*1024*1024;
        String realpath = request.getServletContext().getRealPath("upload");

        File dir = new File(realpath);
        if(!dir.exists()){
            dir.mkdirs();
        }
        BoardVO one = null;
        MultipartRequest multipartRequest =null;

        try {
            multipartRequest = new MultipartRequest(request,realpath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
            filename = multipartRequest.getFilesystemName("img");

            one = new BoardVO();
            String seq = multipartRequest.getParameter("seq");
            if(seq!=null && !seq.equals(""))one.setSeq(Integer.parseInt(seq));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setContent(multipartRequest.getParameter("content"));
//            one.setRegdate(multipartRequest.getParameter("regdate"));
            one.setCategory(multipartRequest.getParameter("category"));

            if(seq!=null&&!seq.equals("")){
                BoardDAO dao = new BoardDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(seq));
                if(filename!=null && oldfilename!=null)
                    FileUpload.deleteFile(request,oldfilename);
                else if(filename==null && oldfilename!=null)
                    filename =oldfilename;
            }
            one.setImg(filename);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return one;
    }

    public static void deleteFile(HttpServletRequest request, String filename){
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + filename);
        if( f.exists()) f.delete();
    }
}
