package com.tam.siap.services;

import com.tam.siap.models.Dokumen;
import com.tam.siap.models.JDokumen;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import static com.tam.siap.utils.TamUtils.createDir;

@Service
public class UploadService {

    @Autowired
    Environment environment;

    public String saveFile(MemoryBuffer memoryBuffer, String fileName) {
        String path = environment.getProperty("layanan.images.path");
        String file = path + "/" + fileName;

        saveFile(memoryBuffer, path, file);

        return file;
    }

    public String saveFile(MemoryBuffer memoryBuffer, Dokumen dokumen, int id) {
        String path = environment.getProperty("layanan.document.path") + "/" + dokumen.getPemohon().getUsername() + "/" + id;
//windows        String path = environment.getProperty("layanan.document.path") + "\\" + dokumen.getPemohon().getUsername() + "\\" + id;
        String file = path + "/" + dokumen.getNamaDokumen() + ".pdf";
//windows        String file = path + "\\" + dokumen.getNamaDokumen() + ".pdf";

        saveFile(memoryBuffer, path, file);

        return file;
    }

    private void saveFile(MemoryBuffer memoryBuffer, String path, String file){
        createDir(path);

        File targetFile = new File(file);

        try {
            Files.copy(memoryBuffer.getInputStream(), targetFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            e.printStackTrace();
        }

        IOUtils.closeQuietly(memoryBuffer.getInputStream());
    }
}
