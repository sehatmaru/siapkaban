package com.tam.siap.services;

import com.tam.siap.models.Dokumen;
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
        String file = path + "\\" + fileName;

        saveFile(memoryBuffer, path, file);

        return file;
    }

    public String saveFile(MemoryBuffer memoryBuffer, Dokumen dokumen, String nomor) {
        String path = environment.getProperty("layanan.document.path") + "\\" + dokumen.getPemohon().getUsername() + "\\" + nomor;
        String file = path + "\\" + dokumen.getJenisDokumen().getId() + ".pdf";

        saveFile(memoryBuffer, path, file);

        return file;
    }

    public void saveFile(MemoryBuffer memoryBuffer, String path, String file){
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
