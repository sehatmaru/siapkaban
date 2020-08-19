package com.tam.siap.services;

import com.tam.siap.models.Account;
import com.tam.siap.models.JDokumen;
import com.tam.siap.models.SJLayanan;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Objects;

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

    public String saveFile(MemoryBuffer memoryBuffer, String fileName, String username, JDokumen dokumen) {
        String path = environment.getProperty("layanan.document.path");
        String file = path + "/" + username +"/" + dokumen.getId() + "_" + fileName;

        saveFile(memoryBuffer, path, file);

        return file;
    }

    private void saveFile(MemoryBuffer memoryBuffer, String path, String file){
        File dir = new File(path);
        if (!dir.exists()) dir.mkdirs();

        File targetFile = new File(file);

        try {
            Files.copy(memoryBuffer.getInputStream(), targetFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            e.printStackTrace();
        }

        IOUtils.closeQuietly(memoryBuffer.getInputStream());
    }
}
